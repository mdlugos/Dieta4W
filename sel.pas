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
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBComboEdit2: TRxDBComboEdit;
    RxDBComboEdit3: TRxDBComboEdit;
    Label3: TLabel;
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Main;

{$R *.DFM}

procedure TsElementyForm.DataSource2DataChange(Sender: TObject;
  Field: TField);
var s: String;
    n: Integer;
begin
  inherited;
  MainForm.EleJob.IndexFieldNames:='Element';
  MainForm.EleJob.Open;
  s:=Format('%*d',[MainForm.EleJobELEMENT.Size,StrToIntDef(MainForm.FormStorage1.StoredValue['Odpadki'],1)]);
  MainForm.ESuJob.Open;
  if MainForm.ESuJob.FindKey([s,TDataSource(Sender).DataSet['SKLADNIK']]) and (MainForm.ESuJobILOSC.AsInteger<>0)
  then if MainForm.EleJob.FindKey([s]) and (MainForm.EleJobJedn.AsString='%')
       then n:=(100.0 - MainForm.ESuJobILOSC.AsFloat) * TDataSource(Sender).DataSet['GRAM'] / 100.0
       else n:=TDataSource(Sender).DataSet['GRAM'] - MainForm.ESuJobILOSC.AsFloat
  else n:=100;
  Label10.Caption:=Format('%s na %d g czêœci jadalnej',[TDataSource(Sender).DataSet['JEDN'],n]);
end;

end.
