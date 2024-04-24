unit Szukam;

interface

uses Speedbar, SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  MdDBGrid, DBFilter, DB, Placemnt, DBCtrls, RXCtrls, Menus,
  RxMenus;

type
  TSzukamForm = class(TForm)
    Panel1: TPanel;
    OkBtn: TBitBtn;
    DataSource1: TDataSource;
    MdDBGrid1: TMdDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBNavigator1: TDBNavigator;
    FormStorage1: TFormStorage;
    RxMainMenu1: TRxMainMenu;
    Edycja2: TMenuItem;
    Kopiuj1: TMenuItem;
    Wklej1: TMenuItem;
    Wytnij1: TMenuItem;
    Zaznaczwszystko1: TMenuItem;
    BitBtn1: TBitBtn;
    procedure MdDBGrid1MsgShow(Sender: TObject; const Text: String);
    procedure FormCreate(Sender: TObject);
    procedure MenuToolClick(Sender: TObject);
    procedure RxMainMenu1GetItemParams(Sender: TMenu; Item: TMenuItem;
      State: TMenuOwnerDrawState; AFont: TFont; var Color: TColor;
      var Graphic: TGraphic; var NumGlyphs: Integer);
    procedure MdDBGrid1DblClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure MdDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SzukamForm: TSzukamForm;

implementation

uses Main;

{$R *.DFM}

procedure TSzukamForm.MdDBGrid1MsgShow(Sender: TObject;
  const Text: String);
begin
  Caption:=Text;
end;

procedure TSzukamForm.FormCreate(Sender: TObject);
begin
  SzukamForm:=Self;
  FormStorage1.IniFileName:=MainForm.FormStorage1.IniFileName;
  if Owner is TDataSet
  Then Datasource1.DataSet:=TDataSet(Owner);
end;

procedure TSzukamForm.MenuToolClick(Sender: TObject);
var c: TSpeedItem;
begin
  c:=TSpeedItem(MainForm.FindComponent(TMenuItem(Sender).Hint));
  if c is TSpeedItem
    Then c.Click;
end;

procedure TSzukamForm.RxMainMenu1GetItemParams(Sender: TMenu;
  Item: TMenuItem; State: TMenuOwnerDrawState; AFont: TFont;
  var Color: TColor; var Graphic: TGraphic; var NumGlyphs: Integer);
var s: TSpeedItem;
begin
  s:=TSpeedItem(MainForm.FindComponent(Item.Hint));
  if not (s is TSpeedItem) Then Exit;
  Graphic:=s.Glyph;
  NumGlyphs:=s.NumGlyphs;
end;

procedure TSzukamForm.MdDBGrid1DblClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TSzukamForm.DataSource1StateChange(Sender: TObject);
begin
  if TDataSource(Sender).State in dsEditModes Then
    Mddbgrid1.Options:=Mddbgrid1.Options+[dgEditing];
end;

procedure TSzukamForm.MdDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and OkBtn.visible and OkBtn.Default Then
     OkBtn.Click;
end;

procedure TSzukamForm.FormDestroy(Sender: TObject);
begin
  // nie bo juz zlikwiedowany DataSource1.DataSet.Filtered:=False;
  SzukamForm:=nil;
end;

end.
