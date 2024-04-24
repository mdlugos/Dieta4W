unit Dbmemo;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBCtrls, DB, Placemnt;

type
  TDBMemoForm = class(TForm)
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    FormStorage1: TFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBMemoForm: TDBMemoForm;

implementation

uses Main;

{$R *.DFM}

procedure TDBMemoForm.FormCreate(Sender: TObject);
begin
  FormStorage1.IniFileName:=MainForm.FormStorage1.IniFileName;
  with TField(Owner) do
  begin
   Self.Name:=Name+'Form';
   DBMemo1.DataField:=FieldName;
   DataSource1.DataSet:=DataSet;
  end;
end;

procedure TDBMemoForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  Caption:=TDataSource(Sender).DataSet.FindField('Nazwa').DisplayText +': '+ DBMemo1.Field.DisplayLabel;
end;

procedure TDBMemoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDBMemoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 Then Close;
end;

end.
