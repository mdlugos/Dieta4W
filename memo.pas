unit Memo;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Placemnt, MaxMin;

type
  TMemoForm = class(TForm)
    Memo1: TMemo;
    FormStorage1: TFormStorage;
    ComboBox1: TComboBox;
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormStorage1RestorePlacement(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemoForm: TMemoForm;

implementation

uses Main, Child;

{$R *.DFM}

procedure TMemoForm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 Then Close;
end;

procedure TMemoForm.FormCreate(Sender: TObject);
begin
  FormStorage1.IniFileName:=MainForm.FormStorage1.IniFileName;
  ComboBox1.Align:=alTop;
end;

procedure TMemoForm.FormStorage1RestorePlacement(Sender: TObject);
var i: Integer;
begin
  i:=Max(0,ComboBox1.Items.IndexOf(ComboBox1.Text));
  ComboBox1.Style:=csDropDownList;
  ComboBox1.ItemIndex:=i;
  ComboBox1.OnChange(ComboBox1);
end;

procedure TMemoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
