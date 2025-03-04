unit Memo1;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ComCtrls, ExtCtrls, SysUtils, Db,
  adsdata, adsfunc, adstable, adscnnct, aceunpub, adsdictionary,
  FileUt, DateUtil, Placemnt;

type
  TMemoForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    OKBtn: TBitBtn;
    Label1: TLabel;
    Query1: TAdsQuery;
    FormStorage1: TFormStorage;
    magazyn: TAdsConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    dzr: TDateTime;
    cabort: Integer;
  public
    { Public declarations }
  end;

implementation

uses Main;

{$R *.DFM}

procedure TMemoForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TMemoForm1.OKBtnClick(Sender: TObject);
var
  p,r,s,di: String;
  c,d: TDateTime;
  w: Extended;
  v: Currency;
  i,j,k: Word;
  f: Boolean;
  ad, bd : array of string;
  aw, bw : array of Extended;

begin
    if OKBtn.kind<>bkOK Then
    begin
      if OKBtn.kind=bkAbort Then cAbort:=2;
      Exit;
    end;
    OKBtn.Kind:=bkAbort;
    OKBtn.Default:=True;
    cAbort:=1;
    with MainForm,Query1 do
    try
      BtnCloseAll.ButtonClick;
      OpenDataBases(Self);
      DBStatusLabel1.Hide;
      Gauge1.Progress:=0;
      Gauge1.Show;

      cAbort:=1;

      d:=DateTimePicker1.Date;
      DecodeDate(d,k,j,i);
      c:=encodedate(k,12,31);
      d:=EncodeDate(k,j,i);

      if d<dzr
       Then s:=NormalDir(FormStorage1.StoredValue['MAGDEF'])+IntToStr(k)
       Else s:=NormalDir(FormStorage1.StoredValue['MAGDEF'])+'ROBOCZY';
      if FileExists(s+'\Roboczy.add') Then s:=s+'\Roboczy.add'
      else if not FileExists(s+'\MAIN.DBF') Then
      begin
          Memo1.Lines.Add('Brak danych z roku: '+IntToStr(k));
          Exit;
      end;
      Magazyn.Disconnect;
      Magazyn.ConnectPath:=s;
      Magazyn.Connect;

      Memo1.Lines.Add('Import od: '+DateToStr(d)+' do '+DateToStr(c));
      Memo1.Lines.Add('');
      Memo1.Lines.Add('Zerujê stare dane.');
      //ROsJob.Open;
      //RDaJob.Open;
      //RSuJob.Open;
      with RelJob do
      begin
        Open;
        SetRange([d],[c+1]);
        First;
        s:='';
        r:='';
        f:=False;
        while not eof do begin
            r:=adsExtractKey;
            if (s=r) (* or not (ROsJob.FindKey([RelJobData.Value,RelJobPosilek.Value])
                          or RDaJob.FindKey([RelJobData.Value,RelJobPosilek.Value])
                          or RSuJob.FindKey([RelJobData.Value,RelJobPosilek.Value]))
                      *)
            Then begin
             //s:=r;
             Delete;
             f:=True;
             Continue;
            end;
            s:=r;
            Edit;
            RelJobIle_Pos.Clear;
            RelJobD_wartosc.Clear;
            RelJobWart_tot.Clear;
            Next;
        end;
        Application.ProcessMessages;
        if (cAbort>1) or (csDestroying in Self.ComponentState) Then Exit;

      end;
      Memo1.Lines.Add('Otwieram bazê ruchów magazynowych.');

      SQL.Text:=
   'SELECT data,  UPPER(substring(nr_zlec ,2 ,1)) as posilek,  UPPER(substring(nr_zlec ,3, 250)) as dieta, SUM(-wartosc) AS wartosc'#13#10
  +' FROM MAIN'#13#10
  +' WHERE (data between :od and :do) and (nr_mag=:mag) and (LEFT(nr_zlec,1)=:zlec)'#13#10
  +' GROUP BY data, nr_zlec';

      params.ParamValues['mag'] :=MainForm.FormStorage1.StoredValue['magazyn'];
      params.ParamValues['zlec']:=MainForm.FormStorage1.StoredValue['zlecenie'];
      params.ParamValues['od']  :=d;
      params.ParamValues['do']  :=c;

      Open;
      RelJob.Open;
      while not eof do begin
        if not RelJob.FindKey([Query1['Data'],Query1['Posilek']])
        Then begin
             RelJob.Append;
             RelJob.SetFields([Query1['Data'],Query1['Posilek']])
        end;
        if RelJob.FindKey([Query1['Data'],Query1['Posilek'],Query1['Dieta']])
        Then RelJob.Edit
        else begin
             RelJob.Append;
             RelJob.SetFields([Query1['Data'],Query1['Posilek'],Query1['Dieta']])
        end;
        RelJobWart_Tot.Value:=Query1['Wartosc'];
        RelJob.Post;
        Next;
      end;

      Close;
      AdsCloseSQLStatement(); //inaczej nie usunie plików tmp
      Magazyn.Disconnect;

      Application.ProcessMessages;
      if (cAbort>1) or (csDestroying in Self.ComponentState) Then Exit;

      with ROsJob do begin
        Open;
        SetRange([d],[c+1]);
        First;
        While not eof do begin
          if not RelJob.FindKey([ROsJobData.value,ROsJobPosilek.value]) Then
            RelJob.AppendRecord([ROsJobData.value,ROsJobPosilek.value]);
          if GrEx Then begin
            if not RelJob.FindKey([ROsJobData.value,ROsJobPosilek.value,ROsJobDieta.value+'/'+ROsJobGrupa.value]) Then
            RelJob.AppendRecord([ROsJobData.value,ROsJobPosilek.value,ROsJobDieta.value+'/'+ROsJobGrupa.value]);
          end else if not RelJob.FindKey([ROsJobData.value,ROsJobPosilek.value,ROsJobDieta.value]) Then
            RelJob.AppendRecord([ROsJobData.value,ROsJobPosilek.value,ROsJobDieta.value]);
          Next;
        end;
      end;

      Baza.Disconnect;

      Memo1.Lines.Add('Sumujê iloœci posi³ków.');
      DataBaseName:='baza';
      if GrEx
       Then SQL.Text:='UPDATE RELEWY'#13#10
                +'SET ILE_POS = ('#13#10
                +'SELECT SUM(M.ILE_POS) FROM MAIN M WHERE M.DATA=R.data AND M.posilek=r.posilek'#13#10
                +'AND ( R.Dieta = '''' OR R.Dieta = M.Dieta + ''/'' + M.Grupa )'#13#10
                +')'#13#10
                +'FROM RELEWY R'#13#10
                +'WHERE (r.data between :od and :do)'
       else SQL.Text:='UPDATE RELEWY'#13#10
                +'SET ILE_POS = ('#13#10
                +'SELECT SUM(M.ILE_POS) FROM MAIN M WHERE M.DATA=R.data AND M.posilek=r.posilek'#13#10
                +'AND ( R.Dieta = '''' OR R.Dieta = M.Dieta )'#13#10
                +')'#13#10
                +'FROM RELEWY R'#13#10
                +'WHERE (r.data between :od and :do)';

      params.ParamValues['od']:=d;
      params.ParamValues['do']:=c;
      ExecSQL;
      AdsCloseSQLStatement(); //inaczej nie usunie plików tmp

      Application.ProcessMessages;
      if (cAbort>1) or (csDestroying in Self.ComponentState) Then Exit;

      with MainForm, RelJob do begin

      Memo1.Lines.Add('');

      OpenDataBases(Self);
      ROsJob.Open;
      RDaJob.Open;
      RSuJob.Open;

      FindNearest([d]);

      p:='';

      while not eof and (RelJobData.AsDateTime<=c)
      do begin

        j:= j mod 100 +1;
        if j=1 Then Memo1.Lines[Memo1.Lines.Count-1]:='Przetwarzam odczytane dane: '+DateToStr(d)+' '+p+' '+di+#9+ RelJobIle_Pos.DisplayText+'/'+RelJobWart_tot.DisplayText;

        if (p<>RelJobPosilek.AsString) or (d<>RelJobData.AsDateTime) Then begin
           s:=Bookmark;
           SetLength(ad,0);SetLength(aw,0);SetLength(bd,0);SetLength(bw,0);
        end;

        d:=RelJobData.AsDateTime;
        p:=RelJobPosilek.AsString;

        while not eof and (RelJobData.AsDateTime=d) and (RelJobPosilek.AsString=p)
        do begin

          di:=RelJobDieta.AsString;
          w:=RelJobWart_tot.AsCurrency;
          v:=RelJobIle_pos.AsCurrency;

          if v=0 then begin
            SetRange([d,p,'0'],[d,p]);
            First;
            while not eof do begin
              if (grex and (copy(RelJobDieta.Value,2,1)='/') and (Length(RelJobDieta.Value)=3)
                or not GrEx and (Length(RelJobDieta.Value)=1))
                and dind(RelJobDieta.Value,di) Then
                v:=v+RelJobIle_Pos.AsCurrency;
              Next;
            end;
            CancelRange;
            FindNearest([d,p,di]);
            if v<>0 Then begin
              Edit;
              RelJobIle_pos.AsCurrency:=v;
              Post;
            end;
          end;

          if (w<>0) and (v<>0) Then begin
            setlength(ad,length(ad)+1);setlength(aw,length(aw)+1);
            ad[High(ad)]:=di;aw[High(aw)]:=w/v;
          end;

          Next;

        end;

        FindNearest([d,p]);

        while not eof and (RelJobData.AsDateTime=d) and (RelJobPosilek.AsString=p)
        do begin
          di:=RelJobDieta.AsString;
          w:=0;//RelJobWart_tot.AsCurrency;
          v:=RelJobIle_pos.AsCurrency;
          if Length(ad)>0 Then
          for i:=Low(ad) To High(ad) do
            if dind(di,ad[i]) then w:=w+v*aw[i];

          Edit;
          RelJobD_wartosc.Value:=w;
          Post;

        if (w<>0) Then
        begin
          if (v=0) Then
          begin
              Memo1.Lines[Memo1.Lines.Count-1]:='Przetwarzam odczytane dane: '+DateToStr(d)+' '+p+' '+di+#9+ RelJobIle_Pos.DisplayText+'/'+RelJobWart_tot.DisplayText;
              Memo1.Lines.Add('Pieni¹dze do nik¹d!');
              Memo1.Lines.Add('');
              Memo1.Lines.Add('');
          end;
        end else if (v<>0) and (di>='0') Then
          begin
            Memo1.Lines[Memo1.Lines.Count-1]:='Przetwarzam odczytane dane: '+DateToStr(d)+' '+p+' '+di+#9+ RelJobIle_Pos.DisplayText+'/ 0!';
            Memo1.Lines.Add('Posi³ek darmowy!');
            Memo1.Lines.Add('');
            Memo1.Lines.Add('');
          end;

          Application.ProcessMessages;
          if (cAbort>1) or (csDestroying in Self.ComponentState) Then Exit;

        if (di<>'') and (w=0) and (v=0)
        then begin
          f:=True;
          delete;
        end else Next;

        end;
      end;
      if f Then
      begin
        Memo1.Lines.Add('Usuwam duplikaty.');
        Baza.Disconnect;
        //Close;
        Exclusive:=True;
        Baza.Connect;
        Open;
        AdsPackTable;
        //Close;
        Baza.Disconnect;
        Exclusive:=False;
        //Open;
        Application.ProcessMessages;
        if (cAbort>1) or (csDestroying in Self.ComponentState) Then Exit;
      end;
    end;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Gotowe!');
    //Memo1.SetFocus;
  finally
    Gauge1.Hide;
    DBStatusLabel1.Show;
    OpenDataBases(Self);
    if not (csDestroying in Self.ComponentState) Then
    OKBtn.Kind:=bkClose;
    OKBtn.Default:=True;
    if (cAbort>2) Then Self.Release;
    cAbort:=4;
    with Relewy do if Active Then Refresh;
  end;
end;

function MyCallbackFunc( usPercent: Word; ulCallbackID: Longint ): Longint; stdcall;
begin
    Application.ProcessMessages;
    Result := 0;
end;


procedure TMemoForm1.FormCreate(Sender: TObject);
var d: TDateTime;
    s: String;
begin
    FormStorage1.IniFileName:=MainForm.FormStorage1.IniFileName;
    cAbort:=0;
    with Query1 do
    try
      s:=NormalDir(MainForm.FormStorage1.StoredValue['MAGDEF'])+'ROBOCZY';
      if FileExists(s+'\Roboczy.add') Then s:=s+'\Roboczy.add';
      Magazyn.ConnectPath:=s;
      SQL.SetText('SELECT * FROM DATY');
      Open;
      d:=FieldByName('D_Z_MIES2').AsDateTime+1;
      dzr:=FieldByName('D_Z_ROK').AsDateTime+1;
      if ExtractYear(dzr)<ExtractYear(d) Then d:=dzr;
      DateTimePicker1.Date:=d;
      Close;
      AdsRegisterCallbackFunction(@MyCallbackFunc,Longint(Self));
    Except
      cAbort:=4;
      OKBtn.Kind:=bkClose;
    end;
end;

procedure TMemoForm1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=not (cAbort in [1..3]);
  cAbort:=3;
end;

procedure TMemoForm1.FormDestroy(Sender: TObject);
begin
  MainForm.BtnIK.Down:=False;
end;

end.
