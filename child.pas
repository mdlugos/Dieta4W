unit Child;

interface

uses szukam, memo, dbmemo, Clipbrd, VclUtils,
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Placemnt, Grids, DBGrids, RXDBCtrl, MdDBGrid, DB,
  RXCtrls, ExtCtrls, SpeedBar, StdCtrls, Mask, DBCtrls,
  RxDBComb, ToolEdit, RxMenus, RXSplit, Buttons, RxMEMDS,
  StrUtils, Menus, adsdata, adsfunc, adstable, RxLookup;

type
  TChildForm = class(TForm)
    MdDBGrid1: TMdDBGrid;
    FormStorage1: TFormStorage;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    RxSplitter1: TRxSplitter;
    RxMainMenu1: TRxMainMenu;
    Przyciski1: TMenuItem;
    Lcz1: TMenuItem;
    Filtruj1: TMenuItem;
    Edycja2: TMenuItem;
    Zaznaczwszystko1: TMenuItem;
    Wytnij1: TMenuItem;
    Wklej1: TMenuItem;
    Kopiuj1: TMenuItem;
    Wyrfiltra1: TMenuItem;
    Kalkulator1: TMenuItem;
    Wyszukiwanie1: TMenuItem;
    Edytowalny1: TMenuItem;
    Liczzapotrzebowanie1: TMenuItem;
    SpeedBar1: TSpeedBar;
    CancelBtn: TBitBtn;
    OkBtn: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBComboEdit1: TRxDBComboEdit;
    SpeedbarSection1: TSpeedbarSection;
    BtnSearch: TSpeedItem;
    BtnEdit: TSpeedItem;
    BtnFilter: TSpeedItem;
    BtnLink: TSpeedItem;
    BtnLicz: TSpeedItem;
    Ponumeruj1: TMenuItem;
    SpeedbarSection2: TSpeedbarSection;
    SpeedbarSection3: TSpeedbarSection;
    Label1: TLabel;
    Label2: TLabel;
    procedure MdDBGrid1MsgShow(Sender: TObject; const Text: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFilteClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BtnLinClick(Sender: TObject);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure BtnFilteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterActivate(Sender: TDataSet);
    procedure FilterDeactivate(Sender: TDataSet);
    procedure EditEnter(Sender: TObject);
    procedure MdDBGrid1Enter(Sender: TObject);
    procedure MenuToolClick(Sender: TObject);
    procedure Przyciski1Click(Sender: TObject);
    procedure Wyrfiltra1Click(Sender: TObject);
    procedure RxMainMenu1GetItemParams(Sender: TMenu; Item: TMenuItem;
      State: TMenuOwnerDrawState; AFont: TFont; var Color: TColor;
      var Graphic: TGraphic; var NumGlyphs: Integer);
    procedure FormStorage1RestorePlacement(Sender: TObject);
    procedure BtnEdiClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure BtnSearcClick(Sender: TObject);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure BtnLiczZapotClick(Sender: TObject);
    procedure LiczZapDataChange(Sender: TObject; Field: TField);
    procedure LiczDanieDataChange(Sender: TObject; Field: TField);
    procedure LiczPosilekDataChange(Sender: TObject; Field: TField);
    procedure BtnLiczPosilekClick(Sender: TObject);
    procedure BtnLiczDanieClick(Sender: TObject);
    procedure MdDBGrid1DblClick(Sender: TObject);
    procedure FormStorage1SavePlacement(Sender: TObject);
    procedure MdDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure MdDBGrid1EditButtonClick(Sender: TObject);
    procedure MdDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Loca: TAdsTable;
    msgtxt: String;
    constructor Create2(Owner, Sender: TComponent);
    procedure LiczPosilek(Sender: TObject);
    procedure LiczDanie(Sender: TObject);
  end;

implementation

{$R *.DFM}

uses Main, sel, dsu;

constructor TChildForm.Create2(Owner, Sender: TComponent);
var s: TComponentName;
    d: TDataChangeEvent;
    t: TDataSet;
    i: Integer;
begin
  inherited create(Owner);
  FormStorage1.IniFileName:=MainForm.FormStorage1.IniFileName;
  if Sender is TRxSpeedButton Then
  begin
    Tag:=LongInt(Sender);
    Caption:=ReplaceStr((Sender as TRxSpeedButton).Hint,#13#10,'  ');
    s:=Copy(TComponent(Sender).Owner.Name,4,maxint);
    DataSource1.DataSet:=(MainForm.FindComponent(s) as TDataSet);
    DataSource1.DataSet.Open;
    DataSource1.DataSet.Tag:=LongInt(Self);
    Name:=s+'Form';
  end else if Sender is TDataSet Then
  begin
    s:=Sender.Name;
    DataSource1.DataSet:=TDataSet(Sender);
    DataSource1.DataSet.Open;
    Loca:=nil;
    Name:=s+'ModalForm';
    OkBtn.Align:=alRight;
    OkBtn.Visible:=True;
    CancelBtn.Left:=0;
    CancelBtn.Align:=alRight;
    CancelBtn.Visible:=True;
  end;
  if Sender.Tag=0 Then Sender.Tag:=LongInt(Self);

  With MdDBGrid1.Columns do
    For i:=0 to Count-1 do
      with items[i] do
      begin
        if Field=nil Then Continue;
        if Field.Tag=-1 Then ButtonStyle:=cbsNone else
        if Field.CanModify and (@Field.OnSetText<>nil) Then
          ButtonStyle:=cbsEllipsis;
      end;

  Hint:=s;
  FormStorage1.IniSection:=Name;
  t:=TDataSet(MainForm.FindComponent(Copy(s,1,3)+'Job'));
  s:=Copy(s,2,maxint);
  Loca:=TAdsTable(MainForm.FindComponent(s)); {mo¿e byæ nil}

  if TAdsTable(DataSource1.DataSet).MasterSource<>nil Then
  Begin
     with TAdsTable(DataSource1.DataSet),MasterSource
     do begin
        d:=OnDataChange;
        if @d<>nil Then d(MasterSource,nil);
        if DataSet=MainForm.Relewy Then begin
           RxDBLookupCombo1.Visible:=True;
           Label2.Visible:=True;
           Label1.Caption:='&Data:';
           RxDBLookupCombo1.DataField:='Posilek';
        end else begin
           if (DataSet=MainForm.Dania) then begin
              RxDBLookupCombo1.DataField:='Posilek';
              Label1.Caption:='&Danie:';
              Label2.Visible:=True;
           end else begin
              RxDBComboEdit1.Width:=RxDBComboEdit1.Parent.ClientWidth - RxDBComboEdit1.Left;
           end;
           if Label1.Caption='' Then
              Label1.Caption:='&'+t.Fields[0].DisplayLabel+':';
        end;
        BtnSearch.Visible:=(FindField('Pozycja')=nil);
        RxDBComboEdit1.DataField:=t.Fields[0].FieldName;
        RxDBComboEdit1.Visible:=True;
        Label1.Visible:=True;
        DataSource2.DataSet:=DataSet;
        DataSource2.DataSet.Open;
     end;

     if Loca<>nil Then
     begin
           if DataSource2.DataSet.FindField('Posilek')<>nil Then
           With RxDBLookupCombo1 do
           begin
             LookupSource:=MainForm.DSPosilki;
             DataField:='Posilek';
             Visible:=True;
             Label1.Visible:=True;
             if Self.DataSource1.DataSet=MainForm.rSurowce Then
             begin
              BtnLicz.Visible:=True;
              BtnLicz.OnClick:=BtnLiczZapotClick;
              BtnLicz.Hint:='Licz zapotrzebowanie';
              DataSource2.OnDataChange:=LiczZapDataChange;

              With MdDBGrid1.Columns, MainForm do
              For i:=0 to Count-1 do with items[i] do
                if (field<>nil) and (field=rSurowceILOSC) or (field=rSurowceil_tot) {or (field=rSurowcegram) and field.Calculated}
                 Then ButtonStyle:=cbsEllipsis;
             end else
             if Self.DataSource1.DataSet=MainForm.rDania Then
             begin
              BtnLicz.Visible:=True;
              BtnLicz.Hint:='Licz posi³ek';
              BtnLicz.OnClick:=BtnLiczPosilekClick;
              DataSource2.OnDataChange:=LiczPosilekDataChange;
             end (*else
             if Self.DataSource1.DataSet=Mainform.dSurowce Then
             begin
              DataSource3.DataSet:=DataSource2.DataSet;
              PanelDa.Visible:=True;
              RxSplitter1.ControlFirst:=PanelDa;
              RxSplitter1.Visible:=True;
              BtnLicz.Visible:=True;
              BtnLicz.OnClick:=BtnLiczDanieClick;
              BtnLicz.Hint:='Licz danie';
              DataSource2.OnDataChange:=LiczDanieDataChange;
             end*);
           end (*else
           if Self.DataSource1.DataSet=Mainform.sElementy Then
           begin
            DataSource4.DataSet:=DataSource2.DataSet;
            PanelSu.Visible:=True;
            RxSplitter1.ControlFirst:=PanelSu;
            RxSplitter1.Visible:=True;
           end*);
           if not BtnLicz.Visible Then
           if Loca=MainForm.Relewy Then
           begin
              DataSource1.OnDataChange:=LiczPosilekDataChange;
              BtnLicz.Visible:=True;
              BtnLicz.Hint:='Licz posi³ek';
              BtnLicz.OnClick:=BtnLiczPosilekClick;
           end else if Loca=MainForm.Dania Then
           begin
              BtnLicz.Visible:=True;
              BtnLicz.OnClick:=BtnLiczDanieClick;
              BtnLicz.Hint:='Licz danie';
              DataSource1.OnDataChange:=LiczDanieDataChange;
           end;
     end;
  end Else
  begin
   MdDBGrid1.CanUseIndex:=True;
   MdDBgrid1.TitleButtons:=True;
(*
   OkBtn.Align:=alRight;
   OkBtn.Kind:=bkClose;
   okBtn.Width:=okBtn.Width+10;
   OkBtn.Visible:=True;
 *)
   if Self.DataSource1.DataSet=Mainform.Relewy Then
   begin
     (*
     with FormStorage1.StoredProps do
     begin
       Delete(IndexOf('BtnFilter.Down'));
     end;
     *)
     SetFilter(MainForm.Relewy,'DIETA=""');
     //FilterActivate(MainForm.Relewy);
     BtnLicz.Visible:=True;
     BtnLicz.Hint:='Licz posi³ek';
     BtnLicz.OnClick:=BtnLiczPosilekClick;
     DataSource1.OnDataChange:=LiczPosilekDataChange;
  end else
  if Self.DataSource1.DataSet=Mainform.Dania Then
  begin
     BtnLicz.Visible:=True;
     BtnLicz.OnClick:=BtnLiczDanieClick;
     BtnLicz.Hint:='Licz danie';
     DataSource1.OnDataChange:=LiczDanieDataChange;
  end;
  end;

  if DataSource1.DataSet.Filtered Then begin
     with FormStorage1.StoredProps do
     begin
       Delete(IndexOf('BtnFilter.Down'));
     end;
     FilterActivate(Self.DataSource1.DataSet);
  end;

end;

procedure TChildForm.MdDBGrid1MsgShow(Sender: TObject; const Text: String);
begin
  MainForm.MsgBar.Caption:=Text;
  Msgtxt:=Text;
end;

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  if DataSource1.DataSet.Tag=Longint(Self)
     Then DataSource1.DataSet.Tag:=0;
  if FormStyle=fsMDIChild Then
  with TRxSpeedButton(Tag) do
  begin
   Down:=False;
   Tag:=0;
   if DataSource1.DataSet=MainForm.Relewy Then
   begin
     SetFilter(MainForm.Relewy,'DIETA=""');
     FilterActivate(MainForm.Relewy);
   end;
   With MainForm do
   if MDIChildCount=1 Then
   begin
     BtnSearch.Down :=False;
     BtnEdit.Down   :=False;
     BtnFilter.Down :=False;
     BtnLink.Down   :=False;
     BtnLicz.Enabled:=False;
   end;
  end;
end;

procedure TChildForm.BtnFilteClick(Sender: TObject);
begin
  with DataSource1.DataSet do
  try
    if TRxSpeedButton(Sender).Down
     then if Filter<>''
      Then
      try
         FilterActivate(DataSource1.DataSet);
      finally
      end Else Wyrfiltra1Click(Sender)
     Else FilterDeActivate(DataSource1.DataSet);
  finally
   TRxSpeedButton(Sender).Down:=Filtered;
  end;
end;

procedure TChildForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if csDestroying in ComponentState Then Exit;
  if (Loca<>nil) and BtnLink.Down Then
  with MainForm,Loca do
  try
      if Loca.tag=0 Then begin
         Self.BtnLink.Down:=False;
         Exit;
      end;
      DisableControls;
      if (Loca<>Relewy) Then
      begin
        IndexFieldNames:=MasterFields;

        FindKey([TDataSource(Sender).DataSet.FieldByName(MasterFields).AsString]);
      end else
      begin
      SetKey;
        RelewyData.Assign(TDataSource(Sender).DataSet.FieldByName('Data'));
        RelewyPosilek.Assign(TDataSource(Sender).DataSet.FieldByName('Posilek'));
        if not Relewy.Filtered
          Then RelewyDieta.Assign(TDataSource(Sender).DataSet.FieldByName('Dieta'));
      GotoNearest;
      end;
    finally
      EnableControls;
    end;
end;

procedure TChildForm.BtnLinClick(Sender: TObject);
begin
  if BtnLink.Down then
  try
    if (Loca = nil) then
    begin
      if FormStyle=fsMDIChild Then
      begin
        if DataSource1.DataSet=MainForm.Relewy Then MainForm.BtnrDania.ButtonClick
        else if DataSource1.DataSet=MainForm.Osoby Then MainForm.BtnoRelewy.ButtonClick
        else if DataSource1.DataSet=MainForm.Elementy Then MainForm.BtneSurowce.ButtonClick
        else if DataSource1.DataSet=MainForm.Dania Then MainForm.BtndSurowce.ButtonClick
        else if DataSource1.DataSet=MainForm.Surowce Then MainForm.BtnsElementy.ButtonClick;
      end else begin
        if DataSource1.DataSet=MainForm.Dania Then
           With TdSurowceForm.Create2(Self,MainForm.dSurowce) do
           begin
             OkBtn.Kind:=bkClose;
             CancelBtn.Visible:=False;
             Show
           end
        else if DataSource1.DataSet=MainForm.Surowce Then
           With TsElementyForm.Create2(Self,MainForm.sElementy) do
           begin
             OkBtn.Kind:=bkClose;
             CancelBtn.Visible:=False;
             RxDbComboEdit1.Width:=OkBtn.Left - RxDbComboEdit1.Left -4;
             Show;
           end;
      end;
      TRxSpeedButton(Sender).Down:=False;
      Exit;
    end;
    with Loca do begin
      if MasterFields<>''
      Then IndexFieldNames:=MasterFields;
      if Tag=0 Then
        TSpeedItem(MainForm.FindComponent('Btn'+Loca.Name)).Click;
      if Assigned(DataSource1.OnDataChange) then DataSource1.OnDataChange(DataSource1, nil);
    end
  except
    messagebeep(MB_ICONHAND);
    BtnLink.Down:=False;
  end;
end;

procedure TChildForm.RxDBComboEdit1ButtonClick(Sender: TObject);
var i: TSpeedItem;
begin
  if FormStyle=fsMDIChild Then begin
    i:=TSpeedItem(MainForm.FindComponent('Btn'+TRxDBComboEdit(Sender).DataSource.DataSet.Name));
    if i is TSpeedItem Then i.ButtonClick;
  end else With TChildForm.Create2(Self,TRxDBComboEdit(Sender).DataSource.DataSet) do
           begin
             OkBtn.Kind:=bkClose;
             CancelBtn.Visible:=False;
             Show
           end
end;

procedure TChildForm.BtnFilteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t: String;
begin
  if (Button<>mbRight) Then Exit;
  t:=Trim(DataSource1.DataSet.Filter);
  if InputQuery(Caption,'Podaj wyra¿enie filtra:', t)
  Then
  with DataSource1.DataSet do begin
    if t<>'' Then
    try
     SetFilter(DataSource1.DataSet,t);
     FilterActivate(DataSource1.DataSet);
    finally
    end else begin
      FilterDeActivate(DataSource1.DataSet);
      Filter:='';
    end;
  end;
end;

procedure TChildForm.FilterActivate(Sender: TDataSet);
var b: String;
begin
  with TADSTable(Sender) do
  if not Filtered then
  try
    if Sender.InheritsFrom(TADSTable)
    Then
    begin
      b:=AdsExtractKey;
      Filtered:=True;
      AdsSeek(b,stSOFT);
    end Else Filtered:=True;
  except
  end;
  BtnFilter.Down:=Sender.Filtered;
  if Sender.Filtered
     Then MdDBGrid1MsgShow(Sender,'Filtr: '+Sender.Filter);
end;

procedure TChildForm.FilterDeactivate(Sender: TDataSet);
var b: String;
begin
  with TADSTable(Sender) do
  if Filtered then
  try
    if Sender.InheritsFrom(TADSTable)
    and Filtered
    and not IsEmpty Then
    begin
      b:=AdsExtractKey;
      Filtered:=False;
      AdsSeek(b,stSOFT);
    end Else Filtered:=False;
  except
  end;
  BtnFilter.Down:=Sender.Filtered;
  MdDBGrid1MsgShow(Sender,'');
end;

procedure TChildForm.EditEnter(Sender: TObject);
begin
  MainForm.DSLabel.DataSet:=DataSource2.DataSet;
end;

procedure TChildForm.MdDBGrid1Enter(Sender: TObject);
begin
  MainForm.DSLabel.DataSet:=DataSource1.DataSet;
end;

procedure TChildForm.MenuToolClick(Sender: TObject);
var s: TSpeedItem;
begin
  if TMenuItem(Sender).Hint='' Then Exit;
  s:=TSpeedItem(FindComponent(TMenuItem(Sender).Hint));
  if s is TSpeedItem 
     Then s.ButtonClick
     Else MainForm.MenuToolClick(Sender);
end;

procedure TChildForm.Przyciski1Click(Sender: TObject);
begin
  Lcz1.Checked:=BtnLink.Down;
  Filtruj1.Checked:=BtnFilter.Down;
  Wyszukiwanie1.Checked:=BtnSearch.Down;
  Edytowalny1.Checked:=BtnEdit.Down;
  Liczzapotrzebowanie1.Enabled:=BtnLicz.Visible and BtnLicz.Enabled;
  Liczzapotrzebowanie1.Caption:=BtnLicz.Hint;
end;

procedure TChildForm.Wyrfiltra1Click(Sender: TObject);
begin
  BtnFilteMouseUp(BtnFilter,mbRight,[],0,0);
end;

procedure TChildForm.RxMainMenu1GetItemParams(Sender: TMenu;
  Item: TMenuItem; State: TMenuOwnerDrawState; AFont: TFont;
  var Color: TColor; var Graphic: TGraphic; var NumGlyphs: Integer);
var s: TSpeedItem;
begin
  if Item.Hint='' Then Exit;
  s:=TSpeedItem(FindComponent(Item.Hint));
  if s is TSpeedItem Then begin
    Graphic:=s.Glyph;
    NumGlyphs:=s.NumGlyphs;
  end else
    MainForm.RxMainMenu1GetItemParams(Sender,Item,State,AFont,Color,Graphic,NumGlyphs);
end;

procedure TChildForm.FormStorage1RestorePlacement(Sender: TObject);
begin
  if OkBtn.Visible and (OkBtn.Kind=bkOK)
   Then begin
     BtnEdit.Down:=False;
     BtnSearch.Down:=True;
   end;
   if not DataSource1.DataSet.CanModify Then
   begin
     BtnEdit.Down:=False;
   end;
   BtnEdit.Click;
   BtnSearch.Click;
   if DataSource1.DataSet.Filter='' Then
   begin
     DataSource1.DataSet.Filter:=TFormStorage(Sender).StoredValues.Values['Filter'].Value;
     BtnFilter.Click;
   end;
end;

procedure TChildForm.BtnEdiClick(Sender: TObject);
begin
   MdDBGrid1.CanModify:=TRxSpeedButton(Sender).Down;
end;

procedure TChildForm.DataSource1StateChange(Sender: TObject);
begin
  if (TDataSource(Sender).State in dsEditModes)
    and not BtnEdit.Down Then BtnEdit.ButtonClick;
end;

procedure TChildForm.BtnSearcClick(Sender: TObject);
begin
  MdDBGrid1.CanSearch:=TRxSpeedButton(Sender).Down;
end;

procedure TChildForm.RxDBComboEdit2ButtonClick(Sender: TObject);
var t: TAdsTable;
    s: TFileName;
begin
  s:=MainForm.FormStorage1.StoredValue['MAGDEF']+'ROBOCZY';
  if FileExists(s+'\Roboczy.add')
   Then s:=s+'\Roboczy.add';
  t:=TAdsTable.Create(Self);
  with t do Try
  try

  DatabaseName:=s;
  TableName:='INDX_MAT';
  TableType:=MainForm.Relewy.TableType;
  AdsTableOptions.AdsCharType:=MainForm.Relewy.AdsTableOptions.AdsCharType;
  AdsTableOptions.AdsCollation:=MainForm.Relewy.AdsTableOptions.AdsCollation;
  AdsTableOptions.AdsLockType:=MainForm.Relewy.AdsTableOptions.AdsLockType;

  Name:='INDX_MAT';
  ReadOnly:=True;
  Open;
  if TRxDBComboEdit(Sender).Field=MainForm.SurowceNazwa
    Then begin
       FieldByName('Nazwa').Index:=0;
    end else begin
       FieldByName('Index').Index:=0;
    end;
  FieldByName('Nr_mag').Visible:=False;
  With TSzukamForm.Create(t) do
  Try
    t.Filter:='nr_mag="'+MainForm.FormStorage1.StoredValue['magazyn']+'"';
    t.Filtered:=True;
    MdDBGrid1.SelectedIndex:=0;
    MdDBGrid1.Klucz:=TRxDBComboEdit(Sender).Text;
    MdDBGrid1.SelectedField:=Fields[0];
    if ShowModal=mrOK Then
    with TRxDBComboEdit(Sender),Field do
    begin
      DataSource.Edit;
      Value:=T['Index'];
      DataSet['Nazwa']:=t['Nazwa'];
      DataSet['JMag']:=t['JM'];
      DataSet['gram']:=100;
      if t['JM']='kg' Then begin
        DataSet['przel']:=1000;
        DataSet['jedn']:='gram';
      end else if copy(t['JM'],1,1)='g' Then begin
        DataSet['przel']:=1;
        DataSet['jedn']:='gram';
      end else if Copy(t['JM_OPCJA'],1,1)='G' Then begin
        DataSet['przel']:=t['przel'];
        DataSet['jedn']:='gram';
      end else if t['JM_OPCJA']='KG' Then begin
        DataSet['przel']:=t['przel']*1000;
        DataSet['jedn']:='gram';
      end;
    end;
  finally
    Release;
  end;
  except
  end;
  finally
    t.free;
  end;
end;

function slc(List: TStringList; Index1, Index2: Integer): Integer;
var a,b :String;
begin
  a:=List[Index1];
  b:=List[Index2];
  Result:=CompareStr(copy(a,Pos('/',a)+1,maxint),copy(b,Pos('/',b)+1,maxint));
end;

procedure TChildForm.BtnLiczZapotClick(Sender: TObject);
var b,c,d,e,f,g,h,p,q: string;
    a: TDateTime;
    ac,ad,ae,af: TStringList;
    ba,bb,bc,bd,be,bf: Boolean;
    i,j,k: Integer;
    m: TRxMemoryData;

begin
    ac:=TStringList.Create;
    ad:=TStringList.Create;
    ae:=TStringList.Create;
    af:=TStringList.Create;
    m:=TRxMemoryData.Create(Self);
    with MainForm do
    try
      with M do
      begin
        Close;
        FieldDefs.Add('Data',ftDateTime,0,False);
        FieldDefs.Add('Posilek',ftString,1,False);
        FieldDefs.Add('Danie',ftString,DaniaNAZWA.Size,False);
        FieldDefs.Add('Skladnik',ftString,SurowceNAZWA.Size,False);
        FieldDefs.Add('Dieta',ftString,9,False);
        FieldDefs.Add('Ilosc',ftFloat,0,False);
        FieldDefs.Add('Gram',ftFloat,0,False);
        FieldDefs.Add('Ile_pos',ftFloat,0,False);
        Open;
        Fields[0].visible:=False;
        Fields[1].visible:=False;
        TFloatfield(Fields[5]).DisplayFormat:=',0.000';
        TFloatfield(Fields[6]).DisplayFormat:=',0.00';
        TFloatfield(Fields[7]).DisplayFormat:=',0.0';
      end;
      a:=RelewyData.AsDateTime;
      b:=RelewyPosilek.AsString;
      SurJob.Open;
      DanJob.Open;
      DSuJob.Open;
      SurJob.CancelRange;
      DanJob.CancelRange;
      with RDaJob do
      begin
        Open;
        SetRange([a,b],[a,b]);
        First;
        While not eof do begin
          if DanJob.FindKey([rDaJobDanie.Value]) then
          with DSuJob do begin
            SetRange([rDaJobDanie.Value],[rDaJobDanie.Value]);
            First;
            While not eof do
            begin
              if SurJob.FindKey([DSuJobSkladnik.Value]) and (DSuJobIlosc.AsFloat<>0) and (SurJobprzel.AsFloat<>0) Then
              begin
                if grex Then begin
                  With RelJob do
                  begin
                    SetRange([a,b,'0'],[a,b]);
                    Filter:='ile_pos<>0 .and. substr(dieta,2,1)="/" .and. substr(dieta,3,1)>="0" .and. substr(dieta,4,1)=" "';
                    Filtered := True;
                    First;
                    //ac.CommaText:=RDaJobdieta.AsString;
                    //ad.CommaText:=DSuJobdieta.AsString;
                    ae.Clear;
                    af.Clear;
                    //if ac.Count=0 Then ac.add('');
                    //if ad.Count=0 Then ad.add('');
                    g:='';
                    h:='';
                    e:='';
                    f:='';
                    While not eof do begin
                      c:=RelJobDieta.AsString;
                      bf:=dind(c,RDaJobdieta.AsString) and dind(c,DSuJobdieta.AsString);
                      af.add(c);
                      if bf
                        then ae.Add(c)
                        else af.Objects[af.Count-1]:=self;
                      d:=copy(c,3,1);
                      c:=copy(c,1,1);
                      if pos(c,g)=0 Then g:=g+c;
                      if pos(d,h)=0 Then h:=h+d;
                      Next;
                    end;
                  end;
                  if ae.Count=0 Then begin
                     Next;
                     Continue;
                  end;
                  i:=0;
                  p:='';
                  if ae.Count<af.Count Then
                  while i <= ae.Count-1 do begin
                    j:=pos('/',ae[i]);
                    c:=copy(ae[i],1,j-1);
                    d:=copy(ae[i],j,maxint);
                    for k:=ae.Count-1 downto i+1 do begin
                       j:=pos('/',ae[k]);
                       e:=c+copy(ae[k],1,j-1);
                       f:=d+copy(ae[k],j+1,maxint);
                       q:=e+f;
                       bf:=True;
                       for j:=0 to af.Count-1 do
                         bf := bf and ( ( af.Objects[j]=nil ) or not dind(af[j],q));
                       if not bf Then Continue;
                       c:=e;
                       d:=f;
                       //ae[i]:=c;
                       ae.Delete(k);
                    end;

                    //j:=pos('/',ae[i]);
                    //c:=copy(ae[i],1,j-1);
                    //d:=copy(ae[i],j,maxint);

                    if length(c)>1 then begin  //zmiana na -, kolejnoœæ
                      e:='';
                      f:='-';
                      for j:=1 to Length(dietystr) do
                       if pos(dietystr[j],g)<>0 then
                        if pos(dietystr[j],c)<>0
                         Then e:=e+dietystr[j]
                         else f:=f+dietystr[j];
                      if length(f)=1
                        Then c:=''
                      else if length(e)>=length(f)
                        Then c:=f //ac[i]:=f+d
                        else c:=e; //ac[i]:=e+d;
                    end;

                    if length(d)>2 then begin  //zmiana na -, kolejnoœæ
                      e:='/';
                      f:='/-';
                      for j:=1 to Length(grstr) do
                       if pos(grstr[j],h)<>0 then
                        if pos(grstr[j],d)<>0
                         Then e:=e+grstr[j]
                         else f:=f+grstr[j];
                      if length(f)=2
                        Then d:='/'
                      else if length(e)>length(f)
                        Then d:=f
                        else d:=e;
                    end;

                    //ae[i]:=c+d;

                    be:=True;
                    bf:=True;
                    for j:=0 to af.Count-1 do begin
                      bb:= af.Objects[j] = nil;
                      be:= be and ( bb or not dind(af[j],c));
                      bf:= bf and ( bb or not dind(af[j],d));
                    end;
                    if be and (not bf or (length(d)>=length(c)) )then d:='/'
                    else if bf then c:='';

                    //ae[i]:=c+d;

                    p:=p+','+c;
                    if d<>'/' Then
                      p:=p+d;

                    i := Succ(i);
                  end;
                  d:=copy(p,2,maxint);
                end else begin
                  With RelJob do
                  begin
                    SetRange([a,b,'0'],[a,b]);
                    Filter:='ile_pos<>0 .and. substr(dieta,2,1)=" "';
                    Filtered := True;
                    First;
                    d:=''; //+
                    e:=''; //-
                    While not eof do
                    begin
                        c:=RelJobDieta.AsString;
                        if dind(c,RDaJobdieta.AsString)
                         and dind(c,DSuJobdieta.AsString)
                        Then d:=d+c
                        Else e:=e+c;
                      Next;
                    end;
                  end;

                  if e='' Then d:=''
                  else if d='' Then
                  begin
                     Next;
                     Continue;
                  end
                  else if length(d)>2 Then
                  if length(e)<length(d)-1 Then d:='-'+e;
                end;

                if RDaJobIle_p.AsCurrency<>0 then with M do
                begin
                  Append;
                  FieldByName('Data').AsDateTime:=a;
                  FieldByName('Posilek').AsString:=b;
                  FieldByName('Dieta').AsString:=d;
                  FieldByName('Ile_pos').AsCurrency:=RDaJobIle_p.AsCurrency;
                  FieldByName('Skladnik').AsString:=DSuJobSkladnik.AsString+' '+SurJobNazwa.AsString;
                  FieldByName('Gram').AsCurrency:=DSuJobilosc.AsCurrency;
                  FieldByName('Ilosc').AsCurrency:=FieldByName('Ile_pos').AsCurrency*FieldByName('Gram').AsCurrency
                                                       /SurJobprzel.AsCurrency;
                  if (RDaJobIle_pos.FieldKind=fkData) and (RDaJobIle_pos.AsCurrency<>0)
                    Then FieldByName('Danie').AsString:=RDaJobPozycja.AsString+' '+DanJobNazwa.AsString
                    else FieldByName('Danie').AsString:=RDaJobDanie.AsString+' '+DanJobNazwa.AsString;
                  Post;
                end;
              end;
              Next;
            end;
          end;
          Next;
        end;
      end;
    if not MainForm.rSurowce.IsEmpty then
    with TSzukamForm.Create(M) do
    try
      if showmodal=mrOK Then
      with MainForm,M do
      begin
        rSurowce.Append;
        For j:=0 To FieldCount-1 Do
        with rSurowce.FieldByName(Fields[j].FieldName) do
          if IsNull and CanModify
          then if DataType<=ftDateTime then AsString:=Fields[j].AsString else Assign(Fields[j]);
      end;
      M.Close;
    finally
      Release
    end else
    with MainForm,M do
    if Active Then
    begin
      First;
      while not eof do
      begin
        rSurowce.Append;
        For j:=0 To FieldCount-1 Do
        with rSurowce.FieldByName(Fields[j].FieldName) do
          if IsNull and CanModify
          then if DataType<=ftDateTime then AsString:=Fields[j].AsString else Assign(Fields[j]);
        Next;
      end;
      rSurowce.Post;
    end;
    finally
      RelJob.Filtered:=False;
      RelJob.CancelRange;
      RDaJob.CancelRange;
      DSuJOb.CancelRange;
      m.Free;
      ac.Free;
      ad.Free;
      ae.Free;
      af.Free;
    end;
end;

procedure TChildForm.LiczZapDataChange(Sender: TObject; Field: TField);
begin
  if csDestroying in ComponentState Then Exit;
  BtnLicz.Enabled:=(Copy(MainForm.RelewyFlagi.AsString,1,1)='D') and (MainForm.RelewyIle_pos.AsFloat<>0) ;
  if (Sender=DataSource1) and (Loca<>nil) Then DataSource1DataChange(Sender, Field);
end;

procedure TChildForm.LiczDanieDataChange(Sender: TObject; Field: TField);
begin
  if csDestroying in ComponentState Then Exit;
  BtnLicz.Enabled:=Copy(MainForm.DaniaFlagi.AsString,1,1)='S';
  if (Sender=DataSource1) and (Loca<>nil) Then DataSource1DataChange(Sender, Field);
end;

procedure TChildForm.LiczPosilekDataChange(Sender: TObject; Field: TField);
var f: TField;
begin
  if csDestroying in ComponentState Then Exit;
  if (Sender=DataSource1) and (Loca<>nil)
    Then DataSource1DataChange(Sender, Field);
  f:=TDataSource(Sender).DataSet.FindField('Flagi');
  if (f=nil) and (Loca<>nil)
    Then f:=Loca.FindField('Flagi');
  BtnLicz.Enabled:=(f=nil) or (Pos('D',f.AsString)>0) or not BtnLink.Down;
end;

procedure TChildForm.LiczDanie(Sender: TObject);
var a,b: string;
    l: array of Extended;
    i,j: Integer;
    r,s,p: Extended;
    di: String;
begin
    if TComboBox(Sender).ItemIndex<0 Then Exit;
    a:=DataSource1.DataSet.FieldByName('Danie').AsString;
    with MainForm do
    try
      if grex
         Then di:=copy(TComboBox(Sender).Text,1,3)
         Else di:=DietyStr[TComboBox(Sender).ItemIndex+1];
      with TMemoForm(TComponent(Sender).Owner) do
      begin
        Memo1.Clear;
        EleJob.Open;
        SElJob.Open;
        ESuJob.Open;
        SurJob.Open;
        DSuJob.Open;
        DanJob.Open;
        EleJob.CancelRange;
        EleJob.Last;
        SetLength(l,EleJobElement.AsInteger+1);
        for i:=0 to Length(l)-1 Do l[i]:=0;
        SElJob.CancelRange;
        ESuJob.CancelRange;
        SurJob.CancelRange;
        DSuJob.CancelRange;
        DanJob.CancelRange;
        DanJob.FindKey([a]);
        Caption:=DanJobNazwa.AsString+' '+DanJobGramatura.AsString+' '+DanJobJedn.AsString;
        MainForm.IntLiczDanie(di,l, Memo1.Lines);
        //-------proc_en
        r:=0;
        For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do begin
          job:=waga*l[StrToInt(src)];
          r:=r+job;
        end;
        For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do
          if r=0
            Then l[StrToInt(dest)]:=0
            Else l[StrToInt(dest)]:=100 * job / r;
        //-------
        For i:=0 To Length(l)-1 do
          if (l[i]<>0) and EleJob.FindKey([Format('%*d',[EleJobElement.Size,i])])
          and not EleJobIgnoruj.AsBoolean Then begin
             b:=EleJobNazwa.AsString;
             if EleJobJedn.AsString='%' then
               b:=Format('%-*s: %10.4f %s',[EleJobNazwa.Size,b,l[i]/l[0],EleJobJedn.DisplayText])
             else if EleJobJedn.DisplayText<>'' then
               b:=Format('%-*s: %10.4f %s',[EleJobNazwa.Size,b,l[i],EleJobJedn.DisplayText]);
             Memo1.Lines.Add(b)
          end;
      end;
    finally
      DSuJob.CancelRange;
      SElJob.CancelRange;
      SetLength(l,0);
    end;
end;

procedure TChildForm.LiczPosilek(Sender: TObject);
var d: TDateTime;
    b: char;
    a,c,di: string;
    l: array of extended;
    i,j: Integer;
    p,r,s: Extended;
begin
    if TComboBox(Sender).ItemIndex<0 Then Exit;
    d:=DataSource1.DataSet.FieldByName('Data').AsDateTime;
    b:=PChar(DataSource1.DataSet.FieldByName('Posilek').AsString)^;
    with MainForm do
    try
      if grex
         Then di:=copy(TComboBox(Sender).Text,1,3)
         Else di:=copy(TComboBox(Sender).Text,1,1);
      with TMemoForm(TComponent(Sender).Owner) do
      Begin
        EleJob.Open;
        SElJob.Open;
        ESuJob.Open;
        SurJob.Open;
        DSuJob.Open;
        DanJob.Open;
        RDaJob.Open;


        EleJob.CancelRange;
        EleJob.Last;
        SetLength(l,EleJobElement.AsInteger+1);
        for i:=0 to Length(l)-1 Do l[i]:=0;

        SElJob.CancelRange;
        ESuJob.CancelRange;
        SurJob.CancelRange;
        DSuJob.CancelRange;
        DanJob.CancelRange;
        RDaJob.CancelRange;
        RelJob.CancelRange;
        RelJob.FindKey([d,b]);
        Caption:=PosLst[Pos(b,PosStr)-1]+' '+DateToStr(d);
        Memo1.Clear;
        Memo1.Lines.Add(Caption);
        Memo1.Lines.Add('Dieta: '+TComboBox(Sender).Text);
        Memo1.Lines.Add('');
        with RDaJob do
        begin
          SetRange([RelJobData.Value,RelJobPosilek.Value],[RelJobData.Value,RelJobPosilek.Value]);
          First;
          i:=0;
          While not eof do
          begin
            if dind(di,RDaJobDieta.Value) Then
            begin
              inc(i);
              DanJob.FindKey([RDaJobDanie.Value]);
              Memo1.Lines.Add(format('%3d',[i])+'. '
                +Format('%-*s',[DanJobNazwa.Size,DanJobNazwa.AsString])
                +Format('%4s',[DanJobGramatura.AsString])+' '+Trim(DanJobJedn.AsString));
              MainForm.IntLiczDanie(di,l,nil);
            end;
            Next;
          end;
        end;
        Memo1.Lines.Add('');

        //-------proc_en
        r:=0;
        For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do begin
          job:=waga*l[StrToInt(src)];
          r:=r+job;
        end;
        For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do
          if r=0
            Then l[StrToInt(dest)]:=0
            Else l[StrToInt(dest)]:=100 * job / r;
        //-------

        For i:=0 To Length(l)-1 do
           if (l[i]<>0) and EleJob.FindKey([Format('%*d',[EleJobElement.Size,i])])
           and not EleJobIgnoruj.AsBoolean Then begin
             c:=Format('%-*s',[EleJobNazwa.Size,EleJobNazwa.AsString]);
             if EleJobJedn.AsString='%' then
               c:=c+': '+ Format('%10s',[FloatToStrF(l[i]/l[0], ffFixed, 5,4)])+' '+EleJobJedn.DisplayText
             else if EleJobJedn.DisplayText<>'' then
               c:=c+': '+ Format('%10s',[FloatToStrF(l[i], ffFixed, 5,4)])+' '+EleJobJedn.DisplayText;
             Memo1.Lines.Add(c)
           end;

//             Memo1.Lines.Add({Format('%5d',[i])+' '+}Format('%-*s',[EleJobNazwa.Size,EleJobNazwa.AsString])+': '+ Format('%10s',[FloatToStrF(l[i], ffFixed, 5,4)])
//             +' '+EleJobJedn.DisplayText);

      end;
    finally
      RDaJob.CancelRange;
      DSuJob.CancelRange;
      SElJob.CancelRange;
      SetLength(l,0);
    end;
end;

procedure TChildForm.BtnLiczDanieClick(Sender: TObject);
begin
   with TMemoForm.Create(Application) do
   begin
     ComboBox1.Items.Assign(DietyLst);
     ComboBox1.OnChange:=LiczDanie;
     FormStyle:=Self.FormStyle;
     show;
   end;
end;

procedure TChildForm.BtnLiczPosilekClick(Sender: TObject);
var d,p: Tfield;
    s: string;
begin
     With MainForm,RelJob Do try
       d:=DataSource1.DataSet.FieldByName('Data');
       p:=DataSource1.DataSet.FieldByName('Posilek');
       setRange([d.Value,p.Value,'0'],[d.Value,p.Value]);
       if grex
          Then Filter:='ile_pos<>0 .and. substr(dieta,2,1)="/" .and. substr(dieta,3,1)>="0" .and. substr(dieta,4,1)=" "'
          Else Filter:='ile_pos<>0 .and. substr(dieta,2,1)=" "';
       Filtered:=True;
       First;
       if eof Then Exit;
       //ComboBox1.Items.Assign(DietyLst)

       try
       MemoForm:=TMemoForm.Create(Application);
       While not eof do
       begin
         s:=RelJobDieta.AsString;
         s:=s+' '+DietyLst[Pos(s[1],DietyStr)-1];
         if grex Then
            s:=s+'/'+GrLst[Pos(s[3],GrStr)-1];
         MemoForm.ComboBox1.Items.Add(s);
         next;
       end;
       MemoForm.ComboBox1.OnChange:=LiczPosilek;
       MemoForm.FormStyle:=Self.FormStyle;
       MemoForm.show;
       except
         MemoForm.Close;
         Raise;
       end;

     finally
       Filtered:=False;
       Filter:='';
       CancelRange;
     end;
end;

procedure TChildForm.MdDBGrid1DblClick(Sender: TObject);
begin
  with TDBGrid(Sender),SelectedField do
  if DataType=ftMemo Then
  begin
    if ComponentCount=0 Then
      TDBMemoForm.Create(SelectedField);
    with Components[0] as TDBMemoForm do
    begin
      FormStyle:=Self.FormStyle;
      Show;
    end;
  end;
end;

procedure TChildForm.FormStorage1SavePlacement(Sender: TObject);
begin
  TFormStorage(Sender).StoredValues.Values['Filter'].Value:=DataSource1.DataSet.Filter;
end;

procedure TChildForm.MdDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    #13: if OkBtn.visible and OkBtn.Default Then
     OkBtn.Click;
  end;
end;

procedure TChildForm.MdDBGrid1EditButtonClick(Sender: TObject);
begin
  With TMdDBGrid(Sender), SelectedField do
  begin
    if not CanModify and (fieldname<>'il_tot') or (@OnSetText=nil)
      Then Exit;
    DataSource.Edit;
    if (fieldname='ILOSC') or (fieldname='il_tot') Then OnSetText(SelectedField, '=')
    Else OnSetText(SelectedField, ' ');
  end;
end;

procedure TChildForm.MdDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=VK_DOWN) and (ssAlt in Shift)
   Then with TMdDBGrid(Sender) do begin
     EditorMode:=True;
     if Assigned(OnEditButtonClick) Then
     begin
       OnEditButtonClick(Sender);
       Key:=0;
     end;
   end;
end;

procedure TChildForm.FormDestroy(Sender: TObject);
begin
  DataSource1.DataSet.Filtered:=false;
end;

end.
