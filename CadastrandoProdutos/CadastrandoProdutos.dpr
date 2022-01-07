program CadastrandoProdutos;

uses
  Vcl.Forms,
  Atividade in 'Atividade.pas' {Form5},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
