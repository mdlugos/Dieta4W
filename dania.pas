unit dania;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CHILD, Menus, RxMenus, Db, Placemnt, SpeedBar, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, RxLookup, Buttons, ExtCtrls, RXSplit, Grids, DBGrids, MdDBGrid,
  DBCtrls;

type
  TDaniaForm = class(TChildForm)
    ComboBox1: TComboBox;
    procedure RxDBComboEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DaniaForm: TDaniaForm;

implementation

uses Main;

{$R *.DFM}

procedure TDaniaForm.RxDBComboEdit1Change(Sender: TObject);
begin
  inherited;
  MainForm.FormStorage1.StoredValue['Element']:=RxDBComboEdit1.Field.AsInteger;
end;

procedure TDaniaForm.FormCreate(Sender: TObject);
var i: Integer;
    s: String;
begin
  inherited;
  if grex then begin
     s:=MainForm.FormStorage1.StoredValue['EleDieta'];
     ComboBox1.Items.Assign(GrexLst);
     For i:=0 TO GrExLst.Count-1 do
       if copy(GrExLst[i],1,3)=s Then begin
         ComboBox1.ItemIndex:=i;
         Break;
       end;
  end else begin
     ComboBox1.Items.Assign(DietyLst);
     ComboBox1.ItemIndex:=pos(MainForm.FormStorage1.StoredValue['EleDieta'],DietyStr)-1;
  end;
  DataSource2.DataSet:=MainForm.Elementy;
  RxDBComboEdit1.DataField:='Element';
  if not OKBtn.Visible Then ComboBox1.Width:=ClientWidth-ComboBox1.Left-10;  
end;

procedure TDaniaForm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  if Grex
    Then MainForm.FormStorage1.StoredValue['EleDieta']:=Copy(ComboBox1.Text,1,3)
    Else MainForm.FormStorage1.StoredValue['EleDieta']:=DietyStr[ComboBox1.ItemIndex+1];

  if DataSource1.DataSet<>nil Then  DataSource1.DataSet.Refresh;

end;

end.
