unit sel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CHILD, Menus, RxMenus, Db, Placemnt, SpeedBar, RxLookup, StdCtrls,
  Buttons, ToolEdit, RXDBCtrl, DBCtrls, RXSplit, Mask, ExtCtrls, Grids,
  DBGrids, MdDBGrid;

type
  TsElementyForm = class(TChildForm)
    PanelSu: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBComboEdit2: TRxDBComboEdit;
    RxDBComboEdit3: TRxDBComboEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
