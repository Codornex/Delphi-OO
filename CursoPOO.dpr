program CursoPOO;

uses
  Vcl.Forms,
  UnPrincipal in 'UnPrincipal.pas' {frmPrincipal},
  unBase in 'unBase.pas' {frmBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBase, frmBase);
  Application.Run;
end.
