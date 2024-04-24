unit dsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CHILD, Menus, RxMenus, Db, Placemnt, SpeedBar, ToolEdit, RXDBCtrl,
  RxLookup, StdCtrls, Buttons, RXSplit, DBCtrls, Mask, ExtCtrls, Grids,
  DBGrids, MdDBGrid;

type
  TdSurowceForm = class(TChildForm)
    PanelDa: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.
