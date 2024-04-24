program Dieta;

uses
  Forms,
  Main in 'MAIN.PAS' {MainForm},
  Child in 'CHILD.PAS' {ChildForm},
  Szukam in 'SZUKAM.PAS' {SzukamForm},
  Memo in 'MEMO.PAS' {MemoForm},
  Dbmemo in 'DBMEMO.PAS' {DBMemoForm},
  Memo1 in 'MEMO1.PAS' {MemoForm1},
  sel in 'sel.pas' {sElementyForm},
  dsu in 'dsu.pas' {dSurowceForm},
  dania in 'dania.pas' {DaniaForm};

{$R *.RES}

begin
  Application.Title := 'System Dieta 4W';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
