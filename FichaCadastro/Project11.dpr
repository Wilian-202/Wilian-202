program Project11;

uses
  Vcl.Forms,
  FichaCadastro in 'FichaCadastro.pas' {Form5},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
