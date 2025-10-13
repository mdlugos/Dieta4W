unit MdDBGrid;

{$DEFINE ADS}
{=$DEFINE IB}
{=$DEFINE DBASE}
{=$DEFINE BDE}
{$DEFINE RX}
{=$DEFINE QUERY}
{$DEFINE TABLE}
{=$DEFINE RXMEM}
{=$DEFINE RXFILTER}
{=$DEFINE TDBF}
{=$DEFINE TVK}
{=$DEFINE UPPPL}
{$DEFINE FILTER+SORT}
{$define ONFLTR}
interface

uses db, StrUtils,
{$IFDEF WIN32}
    Windows, Math,
  {$IFDEF TVK}
    VKDBFDataSet, VKDBFNTX,
    {$undef TDBF}
    {$undef IB}
    {$undef BDE}
    {$undef ADS}
    {$undef QUERY}
  {$ENDIF}
  {$IFDEF ADS}
    adstable, adsfunc, ace, adsdata,
    {$undef TDBF}
    {$undef IB}
    {$undef BDE}
  {$ENDIF}
  {$IFDEF TDBF}
    dbf,
    {$undef IB}
    {$undef BDE}
  {$ENDIF}
  {$IFDEF IB}
    IBCustomDataSet, IBTable, IBQuery,
    {$undef BDE}
  {$ENDIF}
  {$IFDEF BDE}
    dbtables,
    {$IFDEF RXFILTER}
      DBFilter,
    {$ENDIF}
  {$ELSE}
    {$UNDEF DBASE}
    {$UNDEF RXFILTER}
  {$ENDIF}
  {$IFDEF RXMEM}
    RxMemDS,
  {$ENDIF}
{$ELSE}
   {$UNDEF IB}
   {$UNDEF RXMEM}
   {$DEFINE BDE}
   {$DEFINE RXFILTER}
   {$UNDEF ADS}
   {$UNDEF TDBF}
    dbtables, WinTypes, Winprocs, Str16,
    DBFilter, BDEUtils, MaxMin,
{$ENDIF}
    Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ClipBrd,
{$IFDEF RX}
    RxDBCtrl,
{$ENDIF}
  Grids, DBGrids;
{$IFNDEF TABLE}
  {$UNDEF DBASE}
{$ENDIF}
type

  TMsgShowEvent = Procedure(Sender: TObject; const Text: String) of object;
{$IFDEF DBASE}
  TIndexFieldList = Class(Tlist)
  private
  protected
    function Get(Index: Integer): TField;
    procedure Put(Index: Integer; Item: TField);
  public
{$IFDEF WIN32}
    function Extract(Item: TField): TField;
{$ENDIF}
    function First: TField;
    function IndexOf(Item: TField): Integer;
    procedure Insert(Index: Integer; Item: TField);
    function Last: TField;
    function Remove(Item: TField): Integer;
    property Items[Index: Integer]: TField read Get write Put;
{$IFDEF WIN32}
    default;
{$ENDIF}
  end;
{$ENDIF DBASE}

{$IFDEF TVK}
  TTbl = TVKDBFNTX;
  TID = TVKNTXIndex;
{$ELSE}
  TID = TIndexDef;
 {$IFDEF ADS}
  TTbl = TAdsTable;
  {$IFDEF TABLE}
  TETbl = class(TAdsTable)
  public
    function GetRawKey: String;
  end;
  {$ENDIF}
 {$ELSE}
  {$IFDEF BDE}
  TTbl = TTable;
  {$ELSE}
   {$IFDEF IB}
  TTbl = TIBTable;
   {$ELSE}
    {$IFDEF TDBF}
  TTbl = TDbf;
    {$else}
  TTbl = TDataSet;
    {$ENDIF}
   {$ENDIF}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}





{$IFDEF RX}
  TMdDBGrid = class(TRxDBGrid)
{$ELSE RX}
  TMdDBGrid = class(TDBGrid)
{$ENDIF RX}
  private
    { Private declarations }
{$IFDEF RX}
    FOnGetBtnParams: TGetBtnParamsEvent;
{$else}
    FTitleButtons: Boolean;
    FIniStorage: TComponent;
    FMultiSelect: Boolean;
{$ENDIF RX}
    //FDefaultDrawing: Boolean;
    FOnKeyPress: TKeyPressEvent;
    FOnMsgShow: TMsgShowEvent;
    FPoleName: string;
    FPole: TField;
    FKlucz: String;
    FInUse: boolean;
    FIsCurRow: boolean;
{$IFDEF WIN32}
    FKluczu: Variant;
    FKluczd: Variant;
{$ENDIF}
{$IFDEF RXFILTER}
    FFilter: TRxDBFilter;
{$ENDIF}
    FOldPole: String;
    FOldKlucz: String;
    FOldFilter: String;
    FUseFilter: Boolean;
    FCanModify: Boolean;
    FCanSearch: Boolean;
    FCanUseFilter: Boolean;
    FCanUseIndex: Boolean;
{$IFDEF TABLE}
    FIndexPole: String;
    FIndexID: TIndexDef;
    FValList: TStringList;
    FValPos: Integer;
{$IFDEF BDE}
    FLink: TDataLink;
{$IFDEF DBASE}
    FIndexFieldList: TIndexFieldList;
    FListID: TIndexDef;
    function GetIFL: TIndexFieldList;
    procedure GetIndexFieldList(id: TID);
{$ENDIF DBASE}
    procedure DataChanged(DataSet: TDataSet);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
{$ENDIF BDE}
    function FindIndexFor(Field: TField): TID;
    function GetI(I:Integer): TField;
    function GetIC: Integer;
    function GetCurrentIndexDef: TID;
{$ENDIF TABLE}
    procedure DoRange;
    procedure WMChar(var Msg: TWMChar); message WM_CHAR;
    procedure WMCopy(var Msg: TWMcopy); message WM_COPY;
    procedure WMClear(var Msg: TWMClear); message WM_CLEAR;
    procedure WMPaste(var Msg: TWMPaste); message WM_PASTE;
    procedure WMCut(var Msg: TWMCut); message WM_CUT;
    procedure EMSetSel(var Msg: TWMNoParams); message EM_SETSEL;
    procedure SetKlucz(Klucz: String);
    procedure SetCanUseIndex(value: Boolean);
    procedure SetCanUseFilter(value: Boolean);
    procedure SetCanSearch(value: Boolean);
{$IFDEF WIN32}
{$IFDEF RXFILTER}
    function  OnFiltering(Sender: TObject; DataSet: TDataSet): Boolean;
{$ELSE}
    procedure OnFilterRecord(DataSet: TDataSet; var OnFiltering: Boolean);
{$ENDIF}
{$ENDIF WIN32}
    function GetPole: TField;
  protected
    { Protected declarations }
{$IFDEF RX}
    procedure CheckTitleButton(ACol, ARow: Longint; var Enabled: Boolean); override;
    procedure DoTitleClick(ACol: Longint; AField: TField); override;
{$ENDIF}
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    function CanEditModify: Boolean; override;
    function CanEditShow: Boolean; override;
    function GetEditLimit: Integer; override;
    function CanEditAcceptKey(Key: Char):Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure DrawDataCell(const Rect: TRect; Field: TField;
      State: TGridDrawState); override; { obsolete from Delphi 2.0 }
{$IFDEF WIN32}
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState); override;
{$ENDIF}
{$IFDEF TABLE}
    procedure LinkActive(Value: Boolean); override;
{$ENDIF}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Klucz: string read FKlucz write SetKlucz;
    property UseFilter: boolean read FUseFilter;
{$IFDEF WIN32}
    property Kluczu: Variant read FKluczu;
    property Kluczd: Variant read FKluczd;
{$ENDIF}
    property Pole:  TField read GetPole;
{$IFDEF TABLE}
    property IFields[Index: Integer]: TField read GetI;
    property IFCount: Integer read GetIC;
    function SetIndex(Field: TField): Boolean;
    function CanIndex(Field: TField): Boolean;
{$ENDIF}
    function IndexDef: TID;
    function IsIndexField(Field: TField): Boolean;
    property IsCurRow: Boolean read FIsCurRow;
    procedure RebuildColumns;
{$IFDEF RX}
    procedure CheckButton(Sender: TObject; ACol: LongInt;
      Field: TField; var Enabled: Boolean);
    procedure GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
{$ENDIF}
  published
    { Published declarations }
    property OnMsgShow: TMsgShowEvent read FOnMsgShow write FOnMsgShow;
    property OnKeyPress: TKeyPressEvent read FOnKeyPress write FOnKeyPress;
    property CanModify: Boolean read FCanModify write FCanModify;
    property CanSearch: Boolean read FCanSearch write SetCanSearch;
    property CanUseFilter: boolean read FCanUseFilter write SetCanUseFilter;
    property CanUseIndex: boolean read FCanUseIndex write SetCanUseIndex;
{$IFDEF RXFILTER}
    property Filter: TRxDBFilter read FFilter write FFilter;
{$ENDIF}
{$IFDEF BDE}
{$IFDEF TABLE}
    property DataSource: TDataSource read GetDataSource write SetDataSource;
{$ENDIF}
{$ENDIF}
    //property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing default True;
{$IFNDEF RX}
    property TitleButtons: Boolean read FTitleButtons write FTitleButtons;
    property IniStorage: TComponent read FIniStorage write FIniStorage;
    property MultiSelect: Boolean read fMultiSelect write fMultiSelect;
{$ENDIF}
  end;

procedure Register;

function UPPER(const s: String):String;

{function FindIndexFor(Pole: TField): TIndexDef;}

const MaxChar = '~';
      MinChar = '!';

implementation

procedure Register;
begin
  RegisterComponents('Data Controls', [TMdDBGrid]);
end;
{$IFDEF TABLE}

 {$IFDEF ADS}
function TETbl.GetRawKey: String;
var
  acKeyBuffer   : array[0..ADS_MAX_KEY_LENGTH] of char;
  usKeyBufLen   : UNSIGNED16;
begin
   {  Build the raw key based on the kiLookup key buffer }
   usKeyBufLen := ADS_MAX_KEY_LENGTH + 1;
   BuildRawKey( kiLookup, True { Partial field }, @acKeyBuffer, @usKeyBufLen );
   Result:=copy(acKeyBuffer,1,usKeyBufLen);
end;
 {$ENDIF}

 {$IFDEF BDE}
  {$IFDEF DBASE}
procedure TIndexFieldList.Put(Index: Integer; Item: TField);
begin
  inherited Put (Index,Item);
end;

function TIndexFieldList.Get(Index: Integer): TField;
begin
  Result:=TField(inherited Get(Index));
end;

{$IFDEF WIN32}
function TIndexFieldList.Extract(Item: TField): TField;
begin
  Result:=TField(inherited Extract(Item));
end;
{$ENDIF}

function TIndexFieldList.First: TField;
begin
  Result:=TField(inherited First);
end;

function TIndexFieldList.IndexOf(Item: TField): Integer;
begin
  Result:=inherited IndexOf(Item);
end;

procedure TIndexFieldList.Insert(Index: Integer; Item: TField);
begin
  inherited Insert(Index, Item);
end;

function TIndexFieldList.Last: TField;
begin
  Result:=TField(inherited Last);
end;

function TIndexFieldList.Remove(Item: TField): Integer;
begin
  Result:=inherited Remove(Item);
end;
  {$ENDIF}
{=====Zmiana klucza Indeksowego==============================}
type
  TKeyDataLink = class(TDataLink)
  private
    FGrid: TMdDBGrid;
  protected
    procedure DataSetChanged; override;
  public
    constructor Create(AGrid: TMdDBGrid);
    destructor Destroy; override;
  end;

constructor TKeyDataLink.Create(AGrid: TMdDBGrid);
begin
  inherited Create;
  FGrid := AGrid;
end;

destructor TKeyDataLink.Destroy;
begin
  FGrid := nil;
  inherited Destroy;
end;

procedure TKeyDataLink.DataSetChanged;
begin
  if (DataSet<>nil) and (FGrid<>nil) then FGrid.DataChanged(DataSet);
end;

procedure TMdDBGrid.SetDataSource(Value: TDataSource);
begin
    Inherited DataSource:=Value;
    FLink.DataSource := Value;
end;

function TMdDBGrid.GetDataSource: TDataSource;
begin
  if DataLink <> nil then Result := DataLink.DataSource
  else Result := nil;
end;
 {$ENDIF}
{$ENDIF}
{====================================}

constructor TMdDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //inherited DefaultDrawing := False;
  FPoleName:='';
  FPole:=nil;
  FInUse:= False;
  FKlucz:='';
  FOldPole:='';
  FOldKlucz:='';
  FOldFilter:='';
  FCanSearch:=True;
  FCanModify:=True;
  FCanUseFilter:=True;
  FCanUseIndex:=True;
{$IFDEF TABLE}
  FIndexPole:='';
 {$IFDEF BDE}
  FLink:=TKeyDataLink.Create(Self);
  {$IFDEF DBASE}
  FIndexFieldList:=TIndexFieldList.Create;
  FListID:=nil;
  {$ENDIF}
 {$ENDIF}
  FValList:=TStringList.Create;
  FIndexID:=nil;
{$ENDIF}
{$IFDEF WIN32}
  FKluczu:=null;
  FKluczd:=null;
{$ENDIF}
{$IFDEF RXFILTER}
  FFilter:=nil;
{$ENDIF}
  FUseFilter:=False;
end;

destructor TMdDBGrid.Destroy;
begin
{$IFDEF TABLE}
 {$IFDEF BDE}
  FLink.Free;
  FLink := nil;
  {$IFDEF DBASE}
  FIndexFieldList.Free;
  {$ENDIF}
 {$ENDIF}
  FValList.Free;
  FValList := nil;
{$ENDIF}
  inherited Destroy;
end;

function TMdDBGrid.GetPole: TField;
begin
  Result:=nil;
  if (fPoleName<>'') and (DataLink.DataSet<>nil)
  Then Result:=DataLink.DataSet.FindField(fPoleName);
  fPole:=Result;
end;

procedure TMdDBGrid.RebuildColumns;
var i: Integer;
begin
  if (Columns = nil) Then Exit;
  Columns.RebuildColumns;
  For i:=Columns.Count-1 downto 0 do
  with Columns[i] do
    if (Field<>nil) and not Field.Visible Then Destroy;
{$ifdef RX}
  if (IniStorage<>nil) and (DataSource <> nil) and (DataSource.DataSet<>nil) Then
{  try
     IniStorage.IniNeeded(False);}
     InternalRestoreLayout(IniStorage.IniFile,DataLink.DataSet.Name);
{  finally
     IniStorage.IniFree;
  end;}
{$endif}
end;

{$IFDEF BDE}
 {$IFDEF TABLE}
procedure TMdDBGrid.DataChanged(DataSet: TDataSet);
var i: TID;
begin
  if FInUse or (Klucz='') or FUseFilter Then Exit;
    i:=FIndexID;
    FIndexID:=nil;
   if DataSet.InheritsFrom(TTable)
   and FCanUseIndex
   and ((TTable(DataSet).MasterSource=nil)
     or (TTable(DataSet).MasterFields=''))
   and ((IndexDef<>i) or TTable(DataSet).DataBase.IsSQLBased
     and ((FIndexPole='') or not IsIndexField(DataSet.FieldByName(FIndexPole))))
   Then FKlucz:=''
end;
 {$ENDIF}
{$ENDIF}

procedure TMdDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
begin

  FIsCurRow:=(DataLink <> nil) and DataLink.Active and (ARow - FixedRows = DataLink.ActiveRecord);

  if FIsCurRow Then AState:=AState + [gdFocused]; //ale nie selected - jak poznaæ bie¿¹cy wiersz

{$IFDEF RX}
  FOnGetBtnParams:=OnGetBtnParams;
  try
    OnGetBtnParams:=GetBtnParams;
{$ENDIF}
    try
      inherited DrawCell(ACol, ARow, ARect, AState);
    except
      on eAbort do Canvas.FillRect(aRect); // mo¿liwoœæ abort w ongetcellparams - ochrona danych osobowych
    else
      Raise;
    end
{$IFDEF RX}
  finally
    OnGetBtnParams:=FOnGetBtnParams;
  end;
{$ENDIF}
end;

{$IFDEF RX}

procedure TMdDBGrid.CheckTitleButton(ACol, ARow: Longint; var Enabled: Boolean);
var e: TCheckTitleBtnEvent;
begin
  e:=OnCheckButton;
  try
     if @e=nil then OnCheckButton:=CheckButton;
     inherited CheckTitleButton(ACol, ARow, Enabled);
  finally
     OnCheckButton:=e;
  end;
end;

procedure TMdDBGrid.DoTitleClick(ACol: Longint; AField: TField);
var e: TTitleClickEvent;
begin
  e:=OnTitleBtnClick;
  try
     if @e=nil then OnTitleBtnClick:=TitleBtnClick;
     inherited DoTitleClick(ACol, AField);
  finally
     OnTitleBtnClick:=e;
  end;
end;

procedure TMdDBGrid.CheckButton(Sender: TObject; ACol: LongInt;
      Field: TField; var Enabled: Boolean);
begin
  Enabled:=fCanUseIndex and not Field.Calculated;
  If not Enabled Then Exit;
 {$IFDEF TABLE}
  Enabled:=DataLink.DataSet.InheritsFrom(TTbl) and (
   {$IFDEF TVK}
    (TTbl(DataLink.DataSet).DataSource=nil)
   {$ELSE}
    (TTbl(DataLink.DataSet).MasterSource=nil)
   {$ENDIF}
    or (TTbl(DataLink.DataSet).MasterFields=''))
    and CanIndex(Field);
  If Enabled Then Exit;
 {$ENDIF}
 {$IFDEF QUERY}
  {$IFDEF BDE}
  Enabled:=DataLink.DataSet.InheritsFrom(TQuery);
  If Enabled Then Exit;
  {$ENDIF}
  {$IFDEF IB}
  Enabled:=DataLink.DataSet.InheritsFrom(TIBQuery);
  If Enabled Then Exit;
  {$ENDIF}
  {$IFDEF ADS}
  Enabled:=DataLink.DataSet.InheritsFrom(TAdsQuery);
  If Enabled Then Exit;
  {$ENDIF}
 {$ENDIF}
 {$IFDEF RXMEM}
  Enabled:=DataLink.DataSet.InheritsFrom(TRxMemoryData);
 {$ENDIF}
end;

procedure TMdDBGrid.GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
 {$IFDEF QUERY}
var s: string;
    p: PChar;
 {$ENDIF}
begin
 try
 {$IFDEF QUERY}
 if (Field=nil) or not (Field.FieldKind in [fkData,fkLookup]) Then Exit;

 if Field.FieldKind = fkLookup
     Then s:=' '+Field.KeyFields+' '
   Else begin
     s:=' '+Field.FieldName+' ';
{$IFNDEF BDE}
     if Field.DataType=ftString
        Then s:='UPPER('+s+')';
{$ENDIF}
   end;

  {$IFNDEF WIN32}
 s[Length(s)+1]:=#0;
  {$ENDIF}
  {$IFDEF BDE}
 if Field.DataSet.InheritsFrom(TQuery)
    and (TQuery(Field.DataSet).SQL.Count>1) Then Begin
   p:=@(TQuery(Field.DataSet).SQL[1][1]);
   if StrPos(p,@s[1])<>nil
   Then Begin
     s:=s+' DESC'#0;
     if StrPos(p,@s[1])<>nil
       THEN SortMarker:=smUp
       ELSE SortMarker:=smDown;
   end;
   exit;
 end;
  {$ENDIF}
  {$IFDEF IB}
 if Field.DataSet.InheritsFrom(TIBQuery) Then Begin
   p:=TIBQuery(Field.DataSet).SQL.GetText;
   if StrPos(p,@s[1])<>nil
   Then Begin
     s:=s+' DESC'#0;
     if StrPos(p,@s[1])<>nil
       THEN SortMarker:=smUp
       ELSE SortMarker:=smDown;
   end;
   exit;
 end;
  {$ENDIF}
  {$IFDEF ADS}
 if Field.DataSet.InheritsFrom(TAdsQuery) Then Begin
   p:=TAdsQuery(Field.DataSet).SQL.GetText;
   if StrPos(p,@s[1])<>nil
   Then Begin
     s:=s+' DESC'#0;
     if StrPos(p,@s[1])<>nil
       THEN SortMarker:=smUp
       ELSE SortMarker:=smDown;
   end;
   exit;
 end;
  {$ENDIF}
 {$ENDIF}
  if not IsIndexField(Field) Then Exit;
  if (IndexDef<>nil) and
{$IFDEF TVK}
   IndexDef.Desc
{$ELSE}
  (ixDescending in IndexDef.Options)
{$ENDIF}
      then SortMarker:=smUp else SortMarker:=smDown;
 finally
   if @FOnGetBtnParams<>nil Then FOnGetBtnParams(Sender,Field,AFont,Background,SortMarker,IsDown);
 end;
end;

procedure TMdDBGrid.TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
 {$IFDEF QUERY}
 procedure setsql(Field: TField; Strings: TStrings);
 var i,j,k: Integer;
     s: String;
     d: TDataSet;
 begin
   if not (Field.FieldKind in [fkData,fkLookup]) Then Exit;
   if Field.FieldKind = fkLookup
     Then s:=' '+Field.KeyFields+' '
   Else begin
     s:=' '+Field.FieldName+' ';
{$IFNDEF BDE}
     if Field.DataType=ftString
        Then s:='UPPER('+s+')';
{$ENDIF}
   end;
   j:=-1;
   for i:=0 To Strings.Count-1 do
   begin
     if pos('ORDER BY ',Strings[i])=1 Then
     begin
      j:=i;
      Break;
     end;
   end;
   d:=Field.DataSet;
   if j<0 THEN
     Strings.Add('ORDER BY '+s+' ASC ')
   else begin
     k:=pos(s,Strings[i]);
     if k<>0 Then begin
       i:=pos(s+' ASC ',Strings[j]);
       if i<>0 then begin
          i:=i+Length(s);
          Strings[j]:=copy(Strings[j],1,i)+'DESC'+copy(Strings[j],i+5,maxint)
       end else begin
          if pos(',',Strings[j])=0
          Then Strings.Delete(j)
          Else begin
             s:=copy(Strings[j],1,k-1)+copy(Strings[j],k+length(s)+6,maxint);
             i:=Length(s);
             if s[i]=',' Then
                SetLength(s,i-1);
             Strings[j]:=s
          end;
     end end else
       Strings[j]:=Strings[j]+','+s+' ASC ';
   end;
   d.Open;
   //Field.DataSet.EnableControls;
 end;
 {$ENDIF QUERY}

begin

 if Field=nil Then Exit;
 {$IFDEF RXMEM}
 if Field.DataSet.InheritsFrom(TRxMemoryData) Then
 begin
   TRxMemoryData(Field.DataSet).SortOnFields(Field.FieldName);
   Exit;
 end;
 {$ENDIF}
 {$IFDEF QUERY}
  {$IFDEF BDE}
 if Field.DataSet.InheritsFrom(TQuery) Then
  setsql(Field,TQuery(Field.DataSet).SQL)
  {$ENDIF BDE}
  {$IFDEF IB}
 if Field.DataSet.InheritsFrom(TIBQuery) Then
  setsql(Field,TIBQuery(Field.DataSet).SQL)
  {$ENDIF IB}
  {$IFDEF ADS}
 if Field.DataSet.InheritsFrom(TAdsQuery) Then
  setsql(Field,TAdsQuery(Field.DataSet).SQL)
  {$ENDIF IB}
  else
 {$ENDIF QUERY}
 {$IFDEF TABLE}
  SetIndex(Field);
 {$ENDIF}
end;

{$ENDIF RX}
{$IFDEF TABLE}
procedure TMdDBGrid.LinkActive(Value: Boolean);
begin
  inherited LinkActive(Value);
  if Value then begin
{$IFNDEF TVK}
    if CanUseIndex then
    if DataLink.DataSet.InheritsFrom(TTbl)
   {$IFDEF WIN32}
//    and not TTbl(DataLink.DataSet).IndexDefs.Updated
   {$ELSE}
    {and (TTbl(DataLink.DataSet).IndexName='')
    and (TTbl(DataLink.DataSet).IndexFieldNames='')}
   {$ENDIF}
    Then TTbl(DataLink.DataSet).IndexDefs.Update
    else
    ;
{$ENDIF}
    if Klucz<>'' then begin
      if (Pole<>nil) and Pole.visible then begin
         SelectedField:=Pole;
         Klucz:=Klucz;
      end else Klucz:='';
    end;
  end else begin
    FIndexPole:='';
 {$IFDEF WIN32}
    FKluczu:=null;
    FKluczd:=null;
 {$ENDIF}
    FOldPole:='';
    FOldKlucz:='';
 {$IFDEF DBASE}
    FIndexFieldList.Clear;
    FListID:=nil;
 {$ENDIF}
    FIndexID:=nil;
    FUseFilter:=False;
    FOldFilter:='';
    if Assigned(FOnMsgShow) then FOnMsgShow(Self,'');
  end;
  {FLink.DataSource:=DataLink.DataSource;}
end;
{$ENDIF}

function Upp(const s: String):String;
const ut: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ               S STZZ          S STZZ   L '
+'A    S    Z   L     AS L LZRAAAALCCCEEEEIIDDNNOOOO RUUUUYT RAAAALCCCEEEEIIDDNNOOOO RUUUUYT';
var i: Integer;
    c: Char;
begin
  Result:=s;
  for i:=1 To Length(s) do
  if byte(s[i]) in [Byte('a') .. Byte('a') + length(ut) -1 ] Then begin
    c:=ut[ Byte(s[i]) - byte('a') + 1 ];
    if c<>' ' Then Result[i]:=c;
  end
end;

function UPPER(const s: String):String;
begin
{$IFDEF UPPPL}
  Result:=AnsiUpperCase(s);
{$ELSE}
  Result:=Upp(s);
{$ENDIF}
end;

procedure TMdDBGrid.DrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
{$IFDEF WIN32}
begin
end;

procedure TMdDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
{$ENDIF}
var
{$IFDEF WIN32}
  Field: TField;
{$ENDIF}
  r: TRect;
  m: TCopyMode;
  i: Integer;
  s: String;
begin

  if FIsCurRow Then State:=State + [gdFocused]; //ale nie selected - jak poznaæ bie¿¹cy wiersz

  //inherited DefaultDrawing := FIsCurRow;

{$IFDEF WIN32}
  Field := Column.Field;
  inherited DrawColumnCell(Rect, DataCol, Column, State);
{$ELSE}
  inherited DrawDataCell(Rect, Field, State);
{$ENDIF}

  if  (Field<>nil) then
  if (Field.DataType in [ftVarBytes .. ftGraphic])
  Then begin
    if Field.IsNull Then Canvas.FillRect(Rect);
  end else if ((Field=Pole){$IFDEF TABLE} or not FUseFilter
  and IsIndexField(Field){$ENDIF})
  and (Field.DataType in [ftString .. ftDateTime])
  and (Length(Klucz)>0)
  then with Canvas do
  begin
    r:=Rect;
    if Field=fPole then begin
     s:=Field.DisplayText;
(*{$ifdef ADS}*)
      i:=Pos(Upp(klucz),Upp(s));
      if Field.Alignment = taRightJustify
      then r.Left:=r.Right-3-TextWidth(Copy(s,i,maxint))
      else r.Left:=r.Left+2+TextWidth(Copy(s,1,i-1));
      r.Right:=r.Left+TextWidth(Copy(s,i,Length(Klucz)));
(*{$else}
      if Field.Alignment = taRightJustify
      then r.Left:=r.Right-3-TextWidth(Copy(s,length(Klucz)+1,maxint))
      else r.Left:=r.Left+2+TextWidth(Copy(s,1,length(Klucz)));
{$endif}*)
     if gdSelected in State then
     begin
      m:=CopyMode;
      CopyMode:=cmDstInvert;
      CopyRect(r,Canvas,r);
      CopyMode:=m;
     end else begin
      brush.Color:=clBtnFace;
      FrameRect(r);
     end;
{$IFDEF TABLE}
    end else begin
 {$IFDEF WIN32}
     if Field.FieldKind=fkLookup then
     begin
       Field:=DataLink.DataSet.FindField(Copy2Symb(Field.KeyFields,';'));
     end;
     if fPole.FieldKind=fkLookup then
     begin
       fPole:=DataLink.DataSet.FindField(Copy2Symb(fPole.KeyFields,';'));
     end;
 {$ENDIF}
     for i:=0 To IFCount - 1 do
     IF IFields[i]=Field Then
     begin
       brush.Color:=clBtnFace;
       FrameRect(r);
     end Else IF IFields[i]=fPole Then break;
{$ENDIF}
    end;
  end;
end;

{$IFDEF TABLE}
function TMdDBGrid.GetI(I: Integer): TField;
begin
  Result:=nil;
  if DataLink.DataSet.InheritsFrom(TTbl) then
  {$IFDEF DBASE}
  If (IndexDef<>nil) and (ixExpression in IndexDef.Options) then
  begin

    GetIFL;
    Result:=TField(FIndexFieldList[I]);
  end else
  {$ENDIF}
  {$IFDEF TVK}
     Result := DataLink.DataSet.FieldByName(ExtractWord(i+1,IndexDef.KeyParser.GetFieldList,[';']))
  {$ELSE}
     Result:=TTbl(DataLink.DataSet).IndexFields[i]
  {$ENDIF}
  else
end;

function TMdDBGrid.GetIC: Integer;
begin
  Result:=0;
  if DataLink.DataSet.InheritsFrom(TTbl) then
  {$IFDEF DBASE}
  If (IndexDef<>nil) and (ixExpression in IndexDef.Options) then
  begin
     GetIFL;
     Result:=FIndexFieldList.Count;
  end else
  {$ENDIF}
  {$IFDEF TVK}
     Result := WordCount(IndexDef.KeyParser.GetFieldList,[';'])
  {$ELSE}
     Result:=TTbl(DataLink.DataSet).IndexFieldCount
  {$ENDIF}
  else
end;

function TMdDBGrid.GetCurrentIndexDef: TID;
var f: string;
    i: integer;
    ids: TIndexDefs;
begin

  Result:=nil;
  try
{$IFDEF TVK}
  if DataLink.DataSet.InheritsFrom(TTbl) then
   Result:=TVKNTXIndex(TTbl(DataLink.DataSet).Indexes.ActiveObject);
{$ELSE}
  f:='';
  if DataLink.DataSet.InheritsFrom(TTbl) then
  With TTbl(DataLink.DataSet) do begin
    if IndexName<>'' then
    with IndexDefs do
    begin
  {$IFDEF WIN32}
     Result:=Find(IndexName);
  {$ELSE}
     if Count=0 then Update;
     Result:=Items[IndexOf(IndexName)];
  {$ENDIF}
     Exit;
    end;
    f:=IndexFieldNames;
    if f='' then
    begin
      if IndexFieldCount=0 Then Exit;
      for i:=0 to IndexFieldCount-1 Do
        f:=f+IndexFields[i].FieldName+';';
      SetLength(f,Length(f)-1);
    end;
    ids:=IndexDefs;
  end else
  Exit;
 {$IFDEF WIN32}
  Result:=IDs.GetIndexForFields(f,False);
 {$ELSE}
  with ids do for i:=0 to Count-1 do
   with items[i] do
    if AnsiCompareText(fields,f)=0 Then begin
       Result:=items[i];
       break;
    end;
 {$ENDIF}
{$ENDIF}
    finally
    if FIndexID<>Result Then
    begin
       FIndexID:=Result;
       FIndexPole:='';
 {$IFDEF DBASE}
       FIndexFieldList.Clear;
       FListID:=nil;
 {$ENDIF}
    end;
    end;
end;

function TMdDBGrid.IndexDef: TID;
begin
  if FIndexID=nil Then
   GetCurrentIndexDef;
  Result:=FIndexID;
end;
 {$IFDEF DBASE}
function TMdDBGrid.GetIFL: TIndexFieldList;
begin
  GetIndexFieldList(IndexDef);
  Result:=FIndexFieldList;
end;

procedure TMdDBGrid.GetIndexFieldList(id: TID);
var r,s: string;
    m,n: Integer;
    p: TField;
begin
  if (id<>nil) and (FListID=id) then Exit
  else FListID:=id;
  FIndexFieldList.Clear;
  if  (id<>nil) then
  if (ixExpression in id.options)
  then begin
    s:=id.Expression+',';
    m:=1;
    for n:=m to length(s) do
    case s[n] of
         #0..#8,#10..#31,'"','''',':',';','?','@','\','`','{'..#255:
                      m:=maxint;
         '!','(','[': m:=n+1;
         '0'..'9': if n=m then m:=maxint;
         'A'..'Z','_','a'..'z': ;
    else
        r:=copy(s,m,n-m);
        m:=n+1;
        if r='' then Continue;
        p:=DataLink.DataSet.FindField(r);
        if p=nil then Continue;
        if FIndexFieldList.IndexOf(p)=-1 Then
           FIndexFieldList.Add(p);
    end;
    Exit;
  end else
  r:=id.Fields
  else
  if DataLink.DataSet.Inheritsfrom(TTable) then with TTable(DataLink.DataSet) do
  begin
    r:=IndexFieldNames;
    if r='' then begin
      For n:=0 To IndexFieldCount-1 do FIndexFieldList.Add(IndexFields[n]);
      Exit;
    end;
  end
  else
  Exit;
  if r<>'' then repeat
    n:= Pos(';',r);
    if n = 0 then begin
      s := r;
      r := '';
    end else begin
      s := Copy(r, 0, n - 1);
      System.Delete(r, 1, n);
    end;
    FIndexFieldList.Add(DataLink.DataSet.FindField(s));
   until r='';
end;
 {$ENDIF}

function TMdDBGrid.FindIndexFor(Field: TField): TID;
var f,s: string;
    i,j,k: Integer;
    l: PChar;
    ids: TIndexDefs;
begin
{$IFDEF TVK}
   Result:=nil;
   try
     Result:=TVKNTXIndex(TTbl(Field.DataSet).Indexes[TTbl(Field.DataSet).SuitableIndex[Field.FieldName]]);
   except
     Exit;
   end;
{$ELSE}
   Result:=nil;
   if IsIndexField(Field) then
   begin
     Result:=IndexDef;
{     Exit;}
   end;
   if Field.DataSet.inheritsfrom(TTbl) then
   ids:=TTbl(Field.DataSet).IndexDefs
   else
   Exit;
   with ids do
   begin
{    Update;}
 {$IFDEF WIN32}
      if Field.FieldKind=fkLookup
       Then f:=';'+AnsiLowerCase(Field.KeyFields)+';'#0
       else
 {$ENDIF}
      f:=';'+AnsiLowerCase(Field.FieldName)+';'#0;
      k:=maxint;
      for i:=0 to Count-1 do
 {$IFDEF BDE}
      if  ixExpression in items[i].options then
      begin
  {$IFDEF DBASE}
       GetIndexFieldList(items[i]);
       j:=FIndexFieldList.IndexOf(Field)+1;
  {$ELSE}
       f:=AnsiLowerCase(Field.FieldName);
       s:=AnsiLowerCase(items[i].Expression);
       j:=pos(f,s);
       if (j>1) and (s[j-1] in ['0'..'9','a'..'z','_'])
          or (j+length(f)<=length(s)) and (s[j+length(f)] in ['0'..'9','a'..'z','_'])
         then j:=0;
  {$ENDIF}
       if j in [1..k-1]
       then begin
          Result:=items[i];
          k:=j;
          if j<=1 Then Break;
       end;
      end
      else
 {$ENDIF}
      begin
        s:=';'+AnsiLowerCase(items[i].fields)+';'#0;
        l:=StrPos(@(s[1]),@(f[1]));
        if l<>nil then
        begin
           l^:=#0;
           j:=0;
           l:=PChar(@(s[1]))-1;
           repeat
             l:=StrScan(l+1,';');
             inc(j);
           until l=nil;
           if j in [1..k-1]
           then begin
             Result:=items[i];
             k:=j;
             if j<=1 Then Break;
           end;
        end;
      end;
   end;
{$ENDIF}
end;

function TMdDBGrid.CanIndex(Field: TField): Boolean;
begin
  Result:= IsIndexField(Field) or (Field.DataType in
 {$IFDEF WIN32}
  [ftString..ftDateTime, ftAutoInc, ftFixedChar, ftWideString, ftLargeint, ftGuid]
 {$ELSE}
  [ftString..ftDateTime]
 {$ENDIF}
 ) and (
 {$IFDEF BDE}
  ((Field.DataSet.InheritsFrom(TTable)) and TTable(Field.DataSet).DataBase.IsSQLBased)
  or
 {$ENDIF}
 {$IFDEF IB}
  Field.DataSet.InheritsFrom(TIBTable)
  or
 {$ENDIF}
  (FindIndexFor(Field)<>nil));
end;

function TMdDBGrid.SetIndex(Field: TField): Boolean;
var p,q: TID;
    a,b: String;
    i: Integer;
    usFieldType : UNSIGNED16;
begin
  Result:=IsIndexField(Field);
{  IF Result then Exit;}
  p:=nil;
  q:=IndexDef;
  IF Field.DataSet.InheritsFrom(TTbl) then
  with TTbl(Field.DataSet) do
  try
{$ifdef ADS}
    ACE.AdsGetFieldType( Handle, ADSFIELD( Field.FieldNo ), @usFieldType );
    if usFieldType>=ADS_NCHAR then begin
     Result:=False;
     Exit;
    end;
{$endif}
    a:=Field.FieldName;
    FIndexPole:='';
    p:=FindIndexFor(Field);
    if (p<>nil) and (p<>q)
    then begin
     b:=p.Name;
{$IFDEF TVK}
     IndexName:=b;
    end;
{$ELSE}
     if b='' {ixPrimary in p.options}
     then IndexFieldNames:=p.Fields
     else IndexName:=b;
     i:=IndexDefs.IndexOf(b);
     p:=IndexDefs.Items[i];
    end else IndexFieldNames:=Field.FieldName;
{$ENDIF}
    Field:=FieldByName(a);
    Result:=True;
  except
    Exit;
  end
  else
  ;
  FIndexPole:=Field.FieldName;
  FIndexID:=p;
end;
{$ELSE TABLE}
function TMdDBGrid.IndexDef: TID;
begin
  Result:=nil;
end;
{$ENDIF}

function TMdDBGrid.IsIndexField(Field: TField): Boolean;
var i: Integer;
    f: TField;
    s: String;
    d: TID;
begin
{$IFDEF TVK}
   Result:=False;
   d:=IndexDef;
   if d=nil Then Exit;
   s:=';'+d.KeyParser.GetFieldList;
   Result:=Pos(';'+Field.FieldName+';',s)>0;
{$ELSE}

{$IFDEF IB}
//{$DEFINE DBIB}
{$ENDIF}
{$IFDEF DBASE}
{$DEFINE DBIB}
{$ENDIF}
   Result:=Field.IsIndexField;
{$IFDEF WIN32}
   if Field.FieldKind=fkLookup Then
   begin
      f:=DataLink.DataSet.FindField(Copy2Symb(Field.KeyFields,';'));
      Result:=(f <> nil) and f.IsIndexField;
   end;
{$ENDIF}
{$IFDEF DBIB}
   if not Result and (
{$IFDEF IB}
   Field.DataSet.inheritsfrom(TIBTable)
{$ENDIF}
{$IFDEF DBASE}
{$IFDEF IB}
   or
{$ENDIF}
   (IndexDef<>nil) and (ixExpression in FIndexID.Options)
{$ENDIF}
   ) then
   for i:=0 TO IFCount-1 do
   if IFields[i]=Field Then
   begin
     Result:=True;
     break;
   end;
{$ENDIF}
{$ENDIF}
end;

procedure TMdDBGrid.SetKlucz(Klucz: string);
begin
  if (Klucz<>'') and
   ( not DataLink.Active or (SelectedField<>nil) and not (SelectedField.DataType in [ftString..ftDateTime])) Then Exit;
  FOldKlucz:=FKlucz;
  FOldPole:=FPoleName;
  FKlucz:=Klucz;
  if SelectedField=nil Then Exit;
  FPoleName:=SelectedField.FieldName;
  DoRange;
end;

procedure TMdDBGrid.SetCanSearch(value: Boolean);
begin
  if not Value and FCanSearch and (Klucz<>'') Then begin
     Klucz:='';
  end;
  FCanSearch:=Value;
end;

procedure TMdDBGrid.SetCanUseIndex(value: Boolean);
begin
  FCanUseIndex:=value;
  if (Klucz<>'') and not CanUseIndex and not fUseFilter Then SetKlucz(Klucz);
end;

procedure TMdDBGrid.SetCanUseFilter(value: Boolean);
begin
  FCanUseFilter:=value;
  if (Klucz<>'') and not CanUseFilter and fUseFilter Then SetKlucz(Klucz);
end;

procedure TMdDBGrid.DoRange;
var i,l: Integer;
    lastuse: boolean;
    u,v: string;
    b: TBookMark;
    y,m,d: Word;
{$IFDEF WIN32}
    va: Variant;
{$else}
    FKluczu, FKluczd: string;
{$ENDIF}

  function mku(koniec, seek: Boolean; u, Klucz: string):string;
  var i,l: Integer;
      d,m,r: Word;
  begin
    L:=Length(Klucz);
    with fpole do
    if Length(u)>l then
    begin
       if (dataType in [ftSmallint..ftBCD]) and (u[1]='-')
         Then Koniec:=not Koniec;
       u:=Klucz+copy(u,l+1,maxint);
       if Koniec
       then case dataType of
       ftString: if seek Then u:=Klucz else u:=Klucz+MaxChar;
       ftSmallint..ftBCD: for i:=l+1 to Length(u)
         do case u[i] of
         '0'..'8': u[i]:='9';
         end;
       ftDate, ftDateTime:
         begin
          for i:=L+1 to Length(u) do
          case u[i] of
          '0'..'8': u[i]:='9';
          end;
          if copy(u,6,5)>'12'+DateSeparator+'31' then u:=copy(u,1,5)+'12'+DateSeparator+'31'+copy(u,11,maxint)
          else if copy(u,9,2)>'28' then begin
             DecodeDate(StrToDate(copy(u,1,8)+'01')+31,r,m,d);
             u:=DateToStr(EncodeDate(r,m,d)-d)+copy(u,11,maxint);
          end;
          if DataType=ftDateTime then begin
            if copy(u,12,7)>'23'+TimeSeparator+'59'+TimeSeparator+'5'
             then u:=copy(u,1,11)+'23'+TimeSeparator+'59'+TimeSeparator+'5'+copy(u,19,maxint)
            else if copy(u,15,4)>'59'+TimeSeparator+'5' then u:=copy(u,1,14)+'59'+TimeSeparator+'5'+copy(u,19,maxint)
            else if copy(u,18,1)>'5' then u:=copy(u,1,17)+'5'+copy(u,19,maxint);
            end;
         end;
       ftTime:
         begin
          for i:=L+1 to Length(u) do
          case u[i] of
          '0'..'8': u[i]:='9';
          end;
          if copy(u,1,7)>'23'+TimeSeparator+'59'+TimeSeparator+'5'
           then u:='23'+TimeSeparator+'59'+TimeSeparator+'5'+copy(u,8,maxint)
          else if copy(u,4,4)>'59'+TimeSeparator+'5' then u:=copy(u,1,3)+'59'+TimeSeparator+'5'+copy(u,8,maxint)
          else if copy(u,7,1)>'5' then u:=copy(u,1,6)+'5'+copy(u,8,maxint);
         end;
       end else case dataType of
       ftString: u:=Klucz;
       ftSmallint..ftBCD, ftTime:
         for i:=L+1 to Length(u) do
         case u[i] of '1'..'9': u[i]:='0';
         end;
       ftDate, ftDateTime:
         begin
          for i:=L+1 to Length(u) do
          case u[i] of '1'..'9': u[i]:='0';
          end;
          if copy(u,6,2)='00' then u:=copy(u,1,5)+'01'+DateSeparator+'01'+copy(u,11,maxint)
          else if copy(u,9,2)='00' then u:=copy(u,1,8)+'01'+copy(u,11,maxint);
         end;
       end;
    end
    else begin
     u:=Klucz;
{=$IFDEF DBASE}
    {with TStringField(pole) do}
    if (DataType=ftString){and (Size>l)} Then
    begin
       if Koniec then
         {if desc then u:=u+MinChar else} u:=u+MaxChar
       else if u[l]=' ' Then u:=u+MinChar;
    end;
{=$ENDIF}
    end;
    result:=u;
  end;

{$IFDEF TABLE}
  procedure setrest(Koniec, s: Boolean);
  var i: Integer;
  begin
    with DataLink.DataSet do begin
      for i:=0 To FValPos-1 do IFields[i].AsString:=FValList[i];
{$IFDEF DBASE}
      if (IndexDef<>nil) and (ixExpression in FIndexID.options)
      then for i:=FValPos+1 To IFCount-1 Do
       IFields[i].AsString:=mku(Koniec,s,FValList[i],'')
      else
{$ENDIF}
{$IFDEF TVK}
{$ELSE}
      if InheritsFrom(TTbl) then TTbl(DataLink.DataSet).KeyFieldCount:=FValPos+1;
{$ENDIF}
    end;
  end;

  procedure ProcFields(Koniec, s: Boolean; u: string);
  begin
    Koniec := Koniec xor (IndexDef<>nil) and
{$IFDEF TVK}
     FIndexID.Desc;
{$ELSE}
     (ixDescending in FIndexID.options);
{$ENDIF}
    fpole.AsString:=mku(Koniec,s,u,FKlucz);
    setrest(Koniec,s);

  end;
{$ENDIF}

begin
  b:=nil;
  LastUse:=finuse;
  finuse:=True;
  with DataLink.DataSet do try
    disablecontrols;
    b:=GetBookmark;
    l:=Length(fKlucz);
    if FCanUseFilter and FUseFilter
{$IFDEF RXFILTER}
    and Assigned(FFilter) and FFilter.Active then
    begin
      FFilter.Deactivate;
      FFilter.Filter.Clear;
      FFilter.Filter.SetText(@(FOldFilter[1]));
      if FOldFilter<>''
        Then FFilter.Activate;
{$ELSE}
{$IFDEF WIN32}
    and Filtered then
    begin
      Filtered:=False;
      Filter:=FOldFilter;
      Filtered:=Filter<>'';
      OnFilterRecord:=nil;
{$ENDIF}
{$ENDIF}
(*
{$IFDEF IB}
      if InheritsFrom(TIBCustomDataSet) then
        fIndexID:=nil
      else
{$ENDIF}
*)
(*{$IFDEF BDE}*)
      GotoBookmark(b)
(*{$ENDIF}*)
      ;
    end;
    FUseFilter:=False;
{$ifndef FILTER+SORT}
 {$IFDEF TABLE}
    with TTbl(DataLink.DataSet) do
     if FCanUseIndex
       and InheritsFrom(TTbl)
  {$IFDEF TVK}
       and ((DataSource=nil)
  {$ELSE}
       and ((MasterSource=nil)
  {$ENDIF}
       or (MasterFields='')) then
  {$ifdef TVK}
       ClearRange;
  {$endif}
  {$ifdef ADS}
       Scoped:=False;
  {$endif}
  {$ifdef BDE}
       CancelRange;
  {$endif}
 {$ENDIF}
{$endif}
    if Assigned(FOnMsgShow) then FOnMsgShow(Self,'');

    if L=0 then begin
      Exit;
    end;

{$ifndef FILTER+SORT}
 {$IFDEF TABLE}
  if not FCanUseIndex
  or not InheritsFrom(TTbl)
  {$IFDEF TVK}
  or ((TTbl(DataLink.DataSet).DataSource<>nil)
  {$ELSE}
  or ((TTbl(DataLink.DataSet).MasterSource<>nil)
  {$ENDIF}
  and (TTbl(DataLink.DataSet).MasterFields<>''))
  or not CanIndex(Pole)
  then begin
 {$ENDIF}
{$endif}

    if FCanUseFilter
{$IFDEF RXFILTER}
    and Assigned(FFilter)
{$ENDIF}
    //and not Pole.Calculated
    then begin
       if not FUseFilter Then
       begin
{$IFDEF RXFILTER}
         if FFilter.Active
         then FOldFilter:=Trim(StrPas(FFilter.Filter.GetText))
         else FOldFilter:='';
{$ELSE}
         if Filtered
         then FOldFilter:=Filter
         else FOldFilter:='';
{$ENDIF}
       end;

       FUseFilter:=True;
{$ifdef ADS}
       TTbl(DataLink.DataSet).AdsTableOptions.AdsCalcFieldsBeforeFilter:=Pole.FieldKind<>fkData;
{$endif}
{$ifdef ONFLTR}
       fklucz:=Upp(fklucz);
       OnFilterRecord:=Self.OnFilterRecord;
       try
         Filtered:=True;
       except
       end;
       Refresh;
       if isEmpty or not Filtered Then begin
          MessageBeep(0);
          fKlucz:=fOldKlucz;
          fPoleName:=fOldPole;
          Filtered:=False;
          if (fKlucz<>'') or (fOldFilter<>'')
           Then Filtered:=True;
          Refresh;
       end;
{$else}
{$IFDEF IB}
       If InheritsFrom(TIBCustomDataSet) Then begin
       case Pole.DataType of
        ftString: begin
             u:='LOWER('+fPoleName+') STARTING WITH '+AnsiQuotedStr(AnsiLowerCase(Klucz),'"');
             fKluczu:=fKlucz;
             fKluczd:=fKlucz;
           end;
        ftSmallint..ftBCD, ftAutoInc, ftLargeInt: begin
           u:=fPole.DisplayText;
           FKluczd:=mku(False,False,u,FKlucz);
           FKluczu:=mku(True,False,u,FKlucz);
           i:=VarType(fPole.AsVariant);
           if i>=2 then begin
           FKluczd:=VarAsType(FKluczd,i);
           FKluczu:=VarAsType(FKluczu,i);
           end;
           v:=StringReplace(StringReplace(FKluczd,',','.',[]),' ','',[rfReplaceAll]);

           u:=fPoleName;
           if FKluczd=FKluczu Then u:= u+' = '+v
           else u:= u+' BETWEEN '+v+ ' AND '+StringReplace(StringReplace(FKluczu,',','.',[]),' ','',[rfReplaceAll]);
          end;
        ftDate..ftDateTime: begin
           u:=fPole.DisplayText;
           FKluczd:=varAsType(mku(False,False,u,FKlucz),varDate);
           DecodeDate(Kluczd,y,m,d);
           v:='"'+inttostr(m)+'/'+inttostr(d)+'/'+inttostr(y)+' '+TimeToStr(Kluczd)+'"';
           FKluczu:=varAsType(mku(True,False,u,FKlucz),varDate);
           DecodeDate(FKluczu,y,m,d);
           u:=fPoleName;
           if FKluczd=FKluczu Then u:= u+' = '+v
           else u:= u+' BETWEEN '+v+' AND "'+inttostr(m)+'/'+inttostr(d)+'/'+inttostr(y)+' '+TimeToStr(Kluczu)+'"';
          end;
       end;
{$ifndef FILTER+SORT}
 {$IFDEF TABLE}
       if FCanUseIndex
       and InheritsFrom(TIBTable)
       and ((TIBTable(DataLink.DataSet).MasterSource=nil) or (TIBTable(DataLink.DataSet).MasterFields=''))
       {and (findIndexFor(Pole)<>nil)}
       then begin
         SetIndex(Pole);
       end
 {$ENDIF}
{$endif}
       end else
{$ENDIF IB}
       case Pole.DataType of
        ftString: begin
{$ifdef ADS}
           //u:=QuotedStr(fKlucz)+' $ '+fPoleName;
           //u:='UPPER('+fPoleName+') = '+QuotedStr(UpperCase(fKlucz)+'*');
           u:=QuotedStr(AnsiUpperCase(fKlucz))+' $ UPPER('+fPoleName+')';
{$else}
           u:=fPoleName+' = '+QuotedStr(fKlucz+'*');
{$endif}
{$IFDEF WIN32}
           fKluczu:=fKlucz;
           fKluczd:=fKlucz;
{$ENDIF}
           end;
        ftBoolean: begin
           if Boolean(pos(Upper(fKlucz),Upper(fPole.DisplayText))) xor fPole.AsBoolean
             Then u:='!'+fPoleName
             Else u:=fPoleName;
{$IFDEF WIN32}
           fKluczu:=fKlucz;
           fKluczd:=fKlucz;
{$ENDIF}
           end;
        ftSmallint..ftWord,ftFloat..ftDateTime: begin
{$ifndef ADS}
           u:=fPole.Text;   //.DisplayText;
           FKluczd:=mku(False,False,u,fKlucz);
           FKluczu:=mku(True,False,u,fKlucz);
{$endif}
{$IFDEF WIN32}
           u:=fPoleName;
           if fPole.DataType in [ftDate .. ftDateTime]
           then begin
{$ifdef ADS}
             u:=QuotedStr(FKlucz)+' $ DTOC('+fPoleName+')';
{$else}
             //FKluczd:=VarAsType(FKluczd,varDate);
             //FKluczu:=VarAsType(FKluczu,varDate);
             if FKluczd=FKluczu Then u:= u+' = '+AnsiQuotedStr(FKluczd,'''')
             else u:= u+' >= '+AnsiQuotedStr(FKluczd,'''')+ ' AND '+u+' <= '+AnsiQuotedStr(FKluczu,'''');
{$endif}
           end else begin
{$ifdef ADS}
             u:=QuotedStr(StringReplace(FKlucz,',','.',[]))+' $ STR('+fPoleName+')';
{$else}
             //DecimalSeparator:='.';
             FKluczd:=VarAsType(FKluczd,varDouble);
             FKluczu:=VarAsType(FKluczu,varDouble);
             if FKluczd=FKluczu Then u:= u+' = '+FloatToStr(FKluczd)
             else u:= u+' >= '+FloatToStr(FKluczd)+ ' AND '+u+' <= '+FloatToStr(FKluczu);
             //DecimalSeparator:=',';
{$endif}
           end;
{$ELSE}
           u:=fPoleName;
             if FKluczd=FKluczu Then u:= u+' = '+QuotedStr(FKluczd)
             else u:= u+' >= '+QuotedStr(FKluczd)+ ' AND '+u+' <= '+QuotedStr(FKluczu);
{$ENDIF}
          end;
       end;
       try
{$IFDEF WIN32}
       if Pole.Lookup or fPole.Calculated
{$IFDEF ADS}
//       or (fPole.DataSet is TTbl) and (UpperCase(TTbl(fPole.DataSet).AdsConnection.ConnectionType)='LOCAL')
{$ENDIF}
{$IFDEF RXMEM}
       or inheritsfrom(TRxMemoryData)
{$ENDIF}
//       or (pole is TNumericField) and (TNumericField(Pole).DisplayFormat<>'')
{$IFDEF RXFILTER}
       Then begin
         FFilter.Filter.Clear;
         if FOldfilter<>'' Then FFilter.Filter.Text:=FOldFilter;
         FFilter.OnFiltering:=Self.OnFiltering;
       end else begin
         FFilter.OnFiltering:=nil;
{$IFDEF IB}
         if not InheritsFrom(TIBCustomDataSet) then
{$ENDIF}
         FFilter.Filter.Clear;
         if FOldfilter<>'' Then
            FFilter.Filter.Add('('+FOldFilter+') and ');
         FFilter.Filter.Add('('+u+')');
         FFilter.Options:=[foCaseInsensitive];
       end;
       FFilter.Activate;
       if Assigned(FOnMsgShow) then FOnMsgShow(Self,'Filtr: '+u);
       except
       end;
       IF not FFilter.Active
        or (DataLink.DataSet.RecordCount=0)
       Then begin
          FFilter.OnFiltering:=nil;
          FFilter.Filter.Clear;
          if FOldfilter<>'' Then
          begin
            FFilter.Filter.Text:=FOldFilter;
            FFilter.Activate;
          end;
{$ELSE}
       Then begin
         Filter:='';
         fklucz:=Upp(fklucz);
         if FOldfilter<>'' Then Filter:=FOldFilter;
         OnFilterRecord:=Self.OnFilterRecord;
       end else begin
         OnFilterRecord:=nil;
{$IFDEF IB}
         if not InheritsFrom(TIBCustomDataSet) then
{$ENDIF}
         FilterOptions:=[foCaseInsensitive];
         if FOldfilter<>'' Then
           Filter:='('+FOldFilter+') and ('+u+')'
         else Filter:=u;
       end;
       Filtered:=True;
       Refresh;
(*
{$IFDEF IB}
       fIndexID:=nil;
{$ENDIF}
*)
       if Assigned(FOnMsgShow) then FOnMsgShow(Self,'Filtr: '+u);
       except
       end;
       IF not Filtered
       or IsEmpty
       Then begin
          OnFilterRecord:=nil;
          Filter:='';
          if FOldfilter<>'' Then
          begin
            Filter:=FOldFilter;
            Filtered:=True;
          end;
(*
{$IFDEF IB}
          fIndexID:=nil;
{$ENDIF}
*)
{$ENDIF}
{$ELSE WIN32}
       FFilter.Filter.Clear;
       if FOldfilter<>'' Then
          FFilter.Filter.Add('('+FOldFilter+') and ');
       FFilter.Filter.Add(u);
       FFilter.Options:=[foCaseInsensitive];
       FFilter.Activate;
       if Assigned(FOnMsgShow) then FOnMsgShow(Self,'Filtr: '+u);
       except
       end;
       IF not FFilter.Active
        or (DataSetRecordCount(DataLink.DataSet)=0)
       Then begin
          FFilter.OnFiltering:=nil;
          FFilter.Filter.Clear;
          if FOldfilter<>'' Then
          begin
            FFilter.Filter.SetText(@(FOldFilter[1]));
            FFilter.Activate;
          end;
{$ENDIF}
          Refresh;
          FUseFilter:=False;
          MessageBeep(0);
          If (fOldKlucz<>'') and (fKlucz<>fOldKlucz) and (fOldPole<>'') Then begin
             fKlucz:=fOldKlucz;
             fPoleName:=fOldPole;
             DoRange;
          end Else begin
             if Assigned(FOnMsgShow)
             then FOnMsgShow(Self,'Nie potrafiê znaleŸæ "'+fKlucz+'" w polu "'+pole.DisplayLabel+'".');
             fOldKlucz:='';
             fKlucz:='';
          end;
       end;
{$endif}
(*
{$IFDEF IB}
       if not InheritsFrom(TIBCustomDataSet) then
{$ENDIF}
       try
         gotoBookmark(b);
       except
       end;
*)
    end
    else begin
      fKlucz:=fOldKlucz;
      fPoleName:=fOldPole;
    end;
{$ifndef FILTER+SORT}
 {$IFDEF TABLE}
    Exit;
  end;
  if DataLink.DataSet.inheritsfrom(TTbl) then
  with {$IFDEF ADS} TETbl {$ELSE} TTbl {$ENDIF} (DataLink.DataSet) do
  try
    FreeBookmark(b);
    SetIndex(Pole);
    b:=GetBookmark;
    FValList.Clear;
    FValPos:=0;
  {$IFDEF WIN32}
    if (fpole.FieldKind = fkLookup)
    then begin
       fpole:=FindField(Copy2Symb(fpole.KeyFields,';'));
       if fpole=nil Then abort;
    end;
  {$ENDIF}
    for i:=0 To IFCount-1 do
    begin
      if (IFields[i]=fpole)
       then begin
        FValPos:=i;
  {$IFDEF DBASE}
        if (IndexDef=nil) or not (ixExpression in FIndexID.Options) Then
  {$ENDIF}
         break;
      end;
      FValList.Add(IFields[i].AsString);
    end;
    u:=fpole.AsString;
    v:=copy(u,1,L);
    if AnsiCompareText(v,FKlucz)<>0
    then repeat
  {$IFDEF TVK}
      va:=VarArrayCreate([0,FValPos],varVariant);
      for i:=0 To FValPos do va[i]:=IFields[i].Value;
      va[FValPos]:=Upper(fKlucz);
      i := TVKNTXIndex(Indexes.ActiveObject).FindKeyFields('', va, true, true);
      if i > 0 then RecNo:=i;
  {$ELSE}
      SetKey;
      ProcFields(False,True,u);
   {$IFDEF ADS}
      v:=GetRawKey;
      if v=Copy(AdsExtractKey,1,Length(v))
       Then Break; {klucze z £=L, nie ma co szukaæ}
   {$ENDIF}
      GotoNearest;
  {$ENDIF}
      u:=fpole.AsString;
      FreeBookmark(b);
      b:=GetBookmark;
  {$IFDEF ADS}
      if found {or (v=Copy(AdsExtractKey,1,Length(v)))}
       Then Break; {klucze z £=L}
  {$ENDIF}
      v:=copy(u,1,L);
      if (AnsiCompareText(v,FKlucz)<>0)
      then begin
          MessageBeep(0);
          If (fOldKlucz<>'') and (fKlucz<>fOldKlucz) and (fOldPole<>'') Then begin
             fKlucz:=fOldKlucz;
             fPoleName:=fOldPole;
             DoRange;
          end Else begin
             if Assigned(FOnMsgShow)
             then FOnMsgShow(Self,'Nie potrafiê znaleŸæ "'+fKlucz+'" w polu "'+fpole.DisplayLabel+'".');
             fOldKlucz:='';
             fKlucz:='';
          end;
          Exit;
      end;

    until True;

    u:=fpole.AsString;
    v:=copy(u,1,L);
    FKlucz:=v;
  {$IFDEF ADS}
    SetKey;
    ProcFields(False,True,u);
    ScopeBegin:=GetRawKey;
    ProcFields(True,True,u);
    ScopeEnd:=GetRawKey;
    Cancel;
    Scoped:=True;
  {$ELSE}
   {$IFDEF TVK}
    v:=TVKNTXIndex(Indexes.ActiveObject).KeyParser.EvaluteKey(TVKNTXIndex(Indexes.ActiveObject).KeyParser.GetFieldList,va);
    TVKNTXIndex(Indexes.ActiveObject).NTXRange.LoKey:=v;
    TVKNTXIndex(Indexes.ActiveObject).NTXRange.HiKey:=Trim(v)+'~';
    TVKNTXIndex(Indexes.ActiveObject).NTXRange.Active:=True;
   {$ELSE}
    SetRangeStart;
    ProcFields(False,False,u);
    {$IFDEF WIN32}
    fKluczd:=fPole.AsVariant;
    {$ENDIF}

    SetRangeEnd;

    ProcFields(True,False,u);
    {$IFDEF WIN32}
    fKluczu:=fPole.AsVariant;
    {$ENDIF}
    ApplyRange;

   {$ENDIF}
  {$ENDIF}
    try

    GotoBookmark(b);

    if (Length(u)>l)
    and (fpole.DataType in [ftFloat..ftDateTime])
    and (u[l+1] in [ThousandSeparator,DecimalSeparator,DateSeparator,TimeSeparator]) Then FKlucz:=FKlucz+u[l+1];
  {$IFDEF TVK}
  {$ELSE}
    u:=IndexFieldNames;
    if u='' then
  {$ENDIF}
    u:=IndexDef.Name;
    u:=u+': ';
    for i:=0 To FValPos-1 do u:=u+FValList[i]+';';

    if Assigned(FOnMsgShow) then FOnMsgShow(Self,'Wybór: '+u+fKlucz);

    except
         MessageBeep(0);
          If (fOldKlucz<>'') and (fKlucz<>fOldKlucz) and (fOldPole<>'') Then begin
             fKlucz:=fOldKlucz;
             fPoleName:=fOldPole;
             DoRange;
         end Else begin
             if Assigned(FOnMsgShow) then
             FOnMsgShow(Self,'Nie potrafiê znaleŸæ "'+fKlucz+'" w polu "'+pole.DisplayLabel+'".');
             fOldKlucz:='';
             fKlucz:='';
  {$ifdef ADS}
             Scoped:=False;
  {$else}
   {$IFDEF TVK}
             ClearRange;
   {$ELSE}
             CancelRange;
   {$ENDIF}
  {$endif}
         end;
    end;
  except
    if State = dsSetKey Then Cancel;
  {$ifdef ADS}
             Scoped:=False;
  {$else}
   {$IFDEF TVK}
             ClearRange;
   {$ELSE}
             CancelRange;
   {$ENDIF}
  {$endif}
    FKlucz:='';
  end;
 {$ENDIF}
{$endif}
    finally
     FreeBookmark(b);
     enablecontrols;
     finuse:=LastUse;
    end;
end;

{w opcjach edycja, w can edit - blokada}

function TMdDBGrid.CanEditShow: Boolean;
begin
  Result:=FCanModify and Inherited CanEditShow;
end;

function TMdDBGrid.CanEditModify: Boolean;
var FieldSetTextEvent: TFieldSetTextEvent;
begin
  Result := False;
  if not ReadOnly and Datalink.Active and not Datalink.Readonly then
  {$ifdef WIN32}
    with Columns[SelectedIndex] do
    if (not ReadOnly) and Assigned(Field)
      and (Field.CanModify and not (Field.DataType in ftNonTextTypes) or Assigned(Field.OnSetText)) then
  {$else}
    FieldSetTextEvent := Fields[SelectedIndex].OnSetText;
    With Fields[SelectedIndex] do
    if not ReadOnly and (CanModify or Assigned(FieldSetTextEvent)) then
  {$endif}
    begin
      Datalink.Edit;
      Result := Datalink.Editing;
      if Result then Datalink.Modified;
    end;
end;


{gdy w on set text szukam w/g nazwy}
function TMdDBGrid.CanEditAcceptKey(Key: Char):Boolean;
begin
  Result:=True; {Inherited CanEditAcceptKey(Key) or (Key<>#13);}
end;

function TMdDBGrid.GetEditLimit: Integer;
begin
  Result:=255;{Inherited GetEditLimit;}
end;

type
  THack = class(TWinControl);
{$IFNDEF WIN32}
  TCustomForm = TForm;
{$ENDIF}

procedure TMdDBGrid.WMChar(var Msg: TWMChar);

  function DoKeyPress(var Msg: TWMChar): Boolean;
  var
    Form: TCustomForm;
    Key: Char;
  begin
    Result := True;
    Form := GetParentForm(Self);
    if (Form <> nil) and TForm(Form).KeyPreview and
      THack(Form).DoKeyPress(Msg) then Exit;
    with Msg do begin
      Key := Char(CharCode);
      if Assigned(FOnKeyPress) then begin
        FOnKeyPress(Self, Key);
      end;
      CharCode := Word(Key);
      if Key=#0 Then Exit;

  if (DataLink.DataSet.State =dsBrowse)
  then
  begin
   case key of
  #8: begin
       Klucz:='';
       Key:=#0;
      end;
  #32..#255:
      begin
         IF not SelectedField.IsValidChar(Key) {CanEditAcceptKey(Key)} then
         begin
             MessageBeep(0);
             if Assigned(FOnMsgShow) then FOnMsgShow(Self,'Nie mo¿na szukaæ '+Key+' w polu "'+SelectedField.DisplayLabel+'".');
         end else if (SelectedField=Pole)
         then Klucz:=Klucz+key
         else Klucz:=key;
         Key:=#0;
      end;
   end;
  end;

      CharCode := Word(Key);
      if Key=#0 Then Exit;

    end;
    Result := False;
  end;

begin
  if not CanSearch or EditorMode and (InplaceEditor<>nil) or not DoKeyPress(Msg) then inherited;
end;

procedure TMdDBGrid.KeyPress(var Key: Char);
begin
  if not CanSearch or EditorMode and (InplaceEditor<>nil) then inherited OnKeyPress := FOnKeyPress;
  try
    inherited KeyPress(Key);
  finally
    inherited OnKeyPress := nil;
  end;
end;

procedure TMdDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;
  newk: string;
  p:    PChar;
  l:    Integer;
  m:    TWMNoParams;
begin
  KeyDownEvent := OnKeyDown;

  if Assigned(KeyDownEvent) then KeyDownEvent(Self, Key, Shift);
  if  CanSearch
  and (ssShift in Shift)
  and ( key in [vk_Left,vk_Right,vk_End,vk_Home] )
  and DataLink.Active
  and (DataLink.DataSet.State =dsBrowse)
  and not (EditorMode and (InplaceEditor<>nil))
  then begin
    if Pole<>SelectedField Then newK:=''
    else newK:=Klucz;
    l:=Length(NewK);
    case key of
      vk_Left: if L>0 then begin
        if  (ssCtrl in Shift) then Begin
           NewK[L]:=#0;
           p:=StrRScan(@(Newk[1]),' ');
           if p<>nil
            Then l:=p-PChar(@(Newk[1]))+1
            else l:=0;
        end else begin
          if (SelectedField.DataType in [ftFloat..ftDateTime])
          and (newK[L] in [ThousandSeparator,DecimalSeparator,DateSeparator,TimeSeparator])
           Then dec(l);
          if l>0 then dec(L);
        end;
        SetLength(NewK,l);
       end;
      vk_Right:
        begin
          NewK:=SelectedField.AsString;
          if Length(NewK)>l Then begin
            if  (ssCtrl in Shift) then Begin
               p:=StrScan(PChar(@(NewK[1]))+l,' ');
               if p<>nil Then SetLength(Newk,p-@(Newk[1])+1);
            end else
            if (SelectedField.DataType in [ftFloat..ftDateTime])
            and (newK[L+1] in [ThousandSeparator,DecimalSeparator,DateSeparator,TimeSeparator])
             Then SetLength(Newk,l+2)
             else SetLength(Newk,l+1);
          end;
        end;
      vk_Home:
        NewK:='';
      vk_End:
        NewK:=SelectedField.AsString;
    end;
    key:=0;
    Klucz:=newk;
  end;

  if  (ssCtrl in Shift)
  and DataLink.Active
  and (DataLink.DataSet.State in [dsBrowse,dsEdit,dsInsert])
  and not (EditorMode and (InplaceEditor<>nil))
  then case key of
    Word('X'): WMCut( m );
    Word('V'): WMPaste( m );
    Word('C'): WMCopy( m );
  end;


  OnKeyDown := nil;
  try
    inherited KeyDown(Key, Shift);
  finally
    OnKeyDown := KeyDownEvent;
  end;
end;

procedure TMdDBGrid.WMCopy(var Msg: TWMCopy);
var i,j: Integer;
      l: TStrings;
      s: String;
      b: TBookmark;
      f: TField;
begin
    if SelectedRows.Count=0 Then begin
       if SelectedField=Nil Then Exit;
       ClipBoard.AsText:=SelectedField.Text;
    end else with DataLink.DataSet do
    begin
      s:='';
      l:=TStringList.Create;
      b:=GetBookmark;
      DisableControls;
      try
  {$ifdef WIN32}
        For i:=0 To Columns.Count-1 do
         With Columns[i],Field do
          if (Field<>nil) and (Field.DataType<=ftDateTime) and Field.Visible Then
        if FieldKind<>fkLookup
          Then s:=s+FieldName+#9
          Else s:=s+StringReplace(KeyFields,';',#9,[rfReplaceAll])+#9;
  {$else}
        For i:=0 To FieldCount-1 do
         With Fields[i] do
          if visible and (DataType<=ftDateTime) then
          s:=s+FieldName+#9;
  {$endif}
        l.Add(s);
        i:=0;
        repeat
          IF SelectedRows.Count>i Then
          begin
           Datalink.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
           inc(i);
          end;
          s:='';
          For j:=1 To WordCount(l[0],[#9]) do begin
            f:=FindField(ExtractWord(j,l[0],[#9]));
            if (F<>nil) and (F.DataType<=ftDateTime) Then
            s:=s+f.Text+#9;
          end;
          l.Add(s);
        until i>=SelectedRows.Count;
        ClipBoard.SetTextBuf(l.GetText);
      finally
        l.Free;
        FreeBookmark(b);
        EnableControls;
      end;
    end;
end;

procedure TMdDBGrid.WMClear(var Msg: TWMClear);
begin
  SelectedRows.Delete;
end;

procedure TMdDBGrid.EMSetSel(var Msg: TWMNoParams);
var
  ABookmark: TBookmark;
begin
  if EditorMode and (InplaceEditor<>nil)
     Then InplaceEditor.SelectAll
     Else
{$ifdef RX}
      SelectAll;
{$else}
begin
  if (dgMultiSelect in Options) and DataLink.Active then begin
    with Datalink.Dataset do begin
      if (BOF and EOF) then Exit;
      DisableControls;
      try
        ABookmark := GetBookmark;
        try
          First;
          while not EOF do begin
            SelectedRows.CurrentRowSelected := True;
            Next;
          end;
        finally
          try
            GotoBookmark(ABookmark);
          except
          end;
          FreeBookmark(ABookmark);
        end;
      finally
        EnableControls;
      end;
    end;
  end;
end;
{$endif}
end;

procedure TMdDBGrid.WMPaste(var Msg: TWMPaste);
  var s: String;
   Data: THandle;
      p,q: PChar;
      fl: TList;
      b: Boolean;
      f: TField;
      i: Integer;
      l: TStringList;

  procedure WklejJob(fl: TList; l: TStrings; var i: Integer);
  var j: Integer;
      f: TField;
  begin
      s:=l[i];
      inc(i);
      if Length(s)=0 Then Exit;
{$ifdef WIN32}
      q:=PChar(s)-1;
{$else}
      q:=@s;
{$endif}
      s[Length(s)+1]:=#0;
      j:=0;
      repeat
        p:=q+1;
        q:=StrScan(p,#9);
        if (q<>nil) Then q^:=#0;
        f:=TField(fl[j]);
        if (f<>nil) (*and (f.Text='') *) and f.CanModify and (f.DataType<=ftDateTime)
         Then f.Text:=StrPas(p);
        inc(j);
      until q=nil;
  end;

begin
   if EditorMode and (InplaceEditor<>nil) Then
   begin
      if not DataLink.Edit Then Exit;
      InplaceEditor.PasteFromClipboard;
      SelectedField.Text:=InplaceEditor.Text;
      Exit;
   end;
    fl:=TList.Create;
    l:=TStringList.Create;
    with DataLink.DataSet do
    try
      if not (DataLink.DataSet.State in dsEditModes) Then DataLink.Edit;

      with Clipboard do
      try
        Open;
        Data := GetClipboardData(CF_TEXT);
        if Data = 0 then Exit
        else try
          p:=GlobalLock(Data);
          l.SetText(p);
        finally
          GlobalUnlock(Data);
        end;
      finally
        Close;
      end;
      if l.Count=0 Then Exit;
      if (l.Count=1) and (Pos(#9,l[0])=0) Then
      begin
        SelectedField.Text:=l[0];
        Exit;
      end;
      b:=False;
      s:=l[0];
{$ifdef WIN32}
      q:=PChar(s)-1;
{$else}
      q:=@s;
{$endif}
      s[Length(s)+1]:=#0;
      repeat
        p:=q+1;
        q:=StrScan(p,#9);
        if (q<>nil) Then q^:=#0;
        f:=FindField(StrPas(p));
        b:=b or (f<>nil);
        fl.Add(f);
      until q=nil;
      inc(p);
      if not b Then begin
{$ifdef WIN32}
       For i:=0 To min(fl.Count,Columns.Count-SelectedIndex)-1
         do fl[i]:=Columns[i+SelectedIndex].Field;
{$else}
       For i:=0 To min(fl.Count,FieldCount-SelectedIndex)-1
         do fl[i]:=Fields[i+SelectedIndex];
{$endif}
       i:=0;
      end else i:=1;
      repeat
        WklejJob(fl,l,i);
        if i<l.Count Then begin
          DataLink.DataSet.Next;
          if DataLink.DataSet.Eof
            Then DataLink.DataSet.Append
            Else DataLink.DataSet.Edit;
        end else Break;
      until False;
    finally
      fl.Free;
      l.Free;
    end;
end;

procedure TMdDBGrid.WMCut(var Msg: TWMCut);
begin
    WMCopy(Msg);
    if SelectedRows.Count=0 Then begin
       if (SelectedField=Nil) or not DataLink.Edit Then Exit;
       SelectedField.Clear;
    end else SelectedRows.Delete;
end;

{$IFDEF WIN32}
{$IFDEF RXFILTER}
function TMdDBGrid.OnFiltering(Sender: TObject; DataSet: TDataSet): Boolean;
{$ELSE}
procedure TMdDBGrid.OnFilterRecord(DataSet: TDataSet; var OnFiltering: Boolean);
{$ENDIF}
var s: String;
    i,l: Integer;
    v,a: Variant;
begin
(*
  v:=null;
  with Pole do begin
  case FieldKind of
   fkLookup: begin
      if LookUpDataSet.Active Then
      begin
        l:=WordCount(KeyFields,[';']);
        if l=1 Then a:=DataSet[KeyFields]
        else begin
          a:=VarArrayCreate([0,l-1], varVariant);
          for i:=1 To l do
          begin
           s:=ExtractWord(i,KeyFields,[';']);
           a[i-1]:=DataSet[s];
          end;
        end;
        s:=''
        v:=LookUpDataSet.Lookup(LookupKeyFields,a,LookupResultField);
      end;
     end;
  else s:=DisplayText;
  end;

*)
  s:=Pole.DisplayText;
  if s<>'' then
//    case dataType of
//     ftString:
//       begin
//         s:=v;
         //l:=Length(fKlucz);if l<Length(s) Then SetLength(s,l);
//{$ifdef UPPPL}
//         OnFiltering:=Pos(AnsiLowerCase(fKlucz),AnsiLowerCase(v))<>0
//{$else}
         OnFiltering:=Pos(fKlucz,Upper(s))<>0
         //AnsiSameText(fKlucz,s);
//{$endif}
//       end
//    else
//      OnFiltering:=(v>=FKluczd) and (v<=FKluczu)
//    end
  Else OnFiltering:=False;
  //end;
end;
{$ENDIF}
initialization
{$IFDEF WIN32}
  Application.UpdateFormatSettings:=False;
{$ENDIF}
  ShortDateFormat := 'yyyy'+DateSeparator+'MM'+DateSeparator+'dd';
end.


