unit FichaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids;

type
  TForm5 = class(TForm)
    PageControl1: TPageControl;
    TabCadastro: TTabSheet;
    TabConsulta: TTabSheet;
    Label3: TLabel;
    Panel1: TPanel;
    EditNome: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    EditIdade: TEdit;
    EditEmail: TEdit;
    Label2: TLabel;
    RadioSexo: TRadioGroup;
    MemoObservacao: TMemo;
    BtnCadastrar: TButton;
    BtnClose: TBitBtn;
    BtnExcluir: TButton;
    GridConsulta: TStringGrid;
    BtnOrdem: TButton;
    BtnCrescente: TButton;

    function RemoveEspaco(const Vago : string) : string;
    function AcrescentandoNumero( valor : integer) : integer;
    procedure BtnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender : TObject);
    function Duplicidade(checar : string) : integer;
    procedure PageControl1Change(Sender: TObject);
    procedure EditNomeExit(Sender: TObject);
    procedure EditNomeEnter(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Ordena;
    procedure Decrescente;
    procedure Crescente;
    procedure BtnDecrescenteClick(Sender: TObject);
    procedure BtnCrescenteClick(Sender: TObject);
  private
   procedure LimpezaGeral;
   procedure Listar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
   Form5: TForm5;
   Contar : integer;
   FMulti : array [1..10] of array [1..5] of string;

implementation

{$R *.dfm}

function TForm5.AcrescentandoNumero(valor: integer): integer;
var
   AcresNumero : integer;
begin
   AcresNumero := valor+1;
   result := AcresNumero;
end;
procedure TForm5.BtnCadastrarClick(Sender: TObject);
var
   NOME_CAD, EMAIL_CAD, SEXO_CAD, OBS_CAD : string;
   IDADE_CAD  : integer;
begin
   if Trim(EditNome.Text) = '' then
   begin
      MessageDlg('O Campo do nome está vazio', mtError,[mbOK],0);
      Exit;
   end;
   if StrToIntDef(EditIdade.Text, 0) = 0 then
   begin
      MessageDlg('O Campo da idade está vazio', mtError,[mbOK],0);
      Exit;
   end;
   Contar := AcrescentandoNumero(Contar);
   NOME_CAD := EditNome.Text;
   EMAIL_CAD := EditEmail.Text;
   IDADE_CAD := StrToInt(EditIdade.Text);
   SEXO_CAD := IntToStr(RadioSexo.ItemIndex);
   OBS_CAD := MemoObservacao.Text;
   if (RadioSexo.ItemIndex = 0) then
   begin
      SEXO_CAD := 'FEMININO'
   end
   else
      SEXO_CAD := 'MASCULINO';
   FMulti[Contar][1] := UpperCase(NOME_CAD);
   FMulti[Contar][2] := IntToStr(IDADE_CAD);
   FMulti[Contar][3] := RemoveEspaco(UpperCase(EMAIL_CAD));
   FMulti[Contar][4] := SEXO_CAD;
   FMulti[Contar][5] := RemoveEspaco(UpperCase(OBS_CAD));
   LimpezaGeral;
   MessageDlg('Cadastro realizado!', mtInformation,[mbOK],0);
   Listar;
end;
procedure TForm5.BtnCrescenteClick(Sender: TObject);
begin
   Crescente;
   Listar;
end;
procedure TForm5.BtnExcluirClick(Sender: TObject);
var
   Excluindo : integer;
   I: Integer;
   J: Integer;
begin
   Excluindo := Duplicidade(EditNome.Text);
   for I := Excluindo to High(FMulti[I]) do
   begin
      if I = 10 then
      begin
         for J := 1 to 5 do
            FMulti[I][J] := ''
      end
      else
      begin
         FMulti[I][1] := FMulti[I + 1][1];
         FMulti[I][2] := FMulti[I + 1][2];
         FMulti[I][3] := FMulti[I + 1][3];
         FMulti[I][4] := FMulti[I + 1][4];
         FMulti[I][5] := FMulti[I + 1][5];
      end;
   end;
      MessageDlg('Cadastro Removido!', mtInformation,[mbOK], 0);
      Listar;
end;
procedure TForm5.BtnDecrescenteClick(Sender: TObject);
begin
   Decrescente;
   Listar;
end;
function TForm5.Duplicidade(checar: string): integer;
var
   I : integer;
begin
   result := -1;
   checar := RemoveEspaco(checar);
   for I := 1 to High(FMulti) do
   begin
      if (UpperCase(checar)) = RemoveEspaco(FMulti[I][1])  then
      begin
         Result := (I);
         break;
      end;
   end;
end;
procedure TForm5.EditNomeEnter(Sender: TObject);
begin
   BtnExcluir.Enabled := False;
   LimpezaGeral;
end;
procedure TForm5.LimpezaGeral;
begin
   MemoObservacao.Lines.Clear;
   EditNome.Clear;
   EditEmail.Clear;
   EditIdade.Clear;
end;
procedure TForm5.Listar;
var
   I: Integer;
begin
   GridConsulta.ColCount := 5;
   GridConsulta.RowCount := 11;
   GridConsulta.FixedCols := 0;
   GridConsulta.FixedRows := 1;
   GridConsulta.Cells[0, 0] := 'Nome';
   GridConsulta.Cells[1, 0] := 'Idade';
   GridConsulta.Cells[2, 0] := 'E-mail';
   GridConsulta.Cells[3, 0] := 'Sexo';
   GridConsulta.Cells[4, 0] := 'Profissão';
   GridConsulta.ColWidths[0] := 180;
   GridConsulta.ColWidths[1] := 45;
   GridConsulta.ColWidths[2] := 230;
   GridConsulta.ColWidths[3] := 95;
   GridConsulta.ColWidths[4] := 230;
   for I := 1 to 10 do
   begin
      GridConsulta.Cells[0, I] := FMulti[I, 1];
      GridConsulta.Cells[1, I] := FMulti[I, 2];
      GridConsulta.Cells[2, I] := FMulti[I, 3];
      GridConsulta.Cells[3, I] := FMulti[I, 4];
      GridConsulta.Cells[4, I] := FMulti[I, 5];
   end;
end;
procedure TForm5.Decrescente;
var
   Externo, Interno, x, y : integer;
   aux : string;
begin
   for Externo := 1 to 9 do
   begin
      for Interno := (Externo+1) to 10 do
      begin
         if (FMulti[Externo,1] < FMulti[Interno,1]) then
         begin
            aux := FMulti[Externo,1];
            FMulti[Externo,1] := FMulti[Interno,1];
            FMulti[Interno,1] := aux;
            aux := FMulti[Externo,2];
            FMulti[Externo,2] := FMulti[Interno,2];
            FMulti[Interno,2] := aux;
            aux := FMulti[Externo,3];
            FMulti[Externo,3] := FMulti[Interno,3];
            FMulti[Interno,3] := aux;
            aux := FMulti[Externo,4];
            FMulti[Externo,4] := FMulti[Interno,4];
            FMulti[Interno,4] := aux;
            aux := FMulti[Externo,5];
            FMulti[Externo,5] := FMulti[Interno,5];
            FMulti[Interno,5] := aux;
         end;
      end;
   end;
end;
procedure TForm5.Crescente;
var
   Externo, Interno, x, y : integer;
   aux, aux1 : String;
begin
   for Externo := 1 to 9 do
   begin
      for Interno := (Externo+1) to 10 do
      begin
         if (FMulti[Interno,1]<>'') then
         begin
            if (FMulti[Externo,1]) > (FMulti[Interno,1]) then
            begin
               aux := FMulti[Externo,1];
               FMulti[Externo,1] := FMulti[Interno,1];
               FMulti[Interno,1] := aux;
               aux := FMulti[Externo,2];
               FMulti[Externo,2] := FMulti[Interno,2];
               FMulti[Interno,2] := aux;
               aux := FMulti[Externo,3];
               FMulti[Externo,3] := FMulti[Interno,3];
               FMulti[Interno,3] := aux;
               aux := FMulti[Externo,4];
               FMulti[Externo,4] := FMulti[Interno,4];
               FMulti[Interno,4] := aux;
               aux := FMulti[Externo,5];
               FMulti[Externo,5] := FMulti[Interno,5];
               FMulti[Interno,5] := aux;
            end;
         end;
      end;
   end;
end;
procedure TForm5.Ordena;
var
   troca : string;
   I, pos, j : integer;
begin
   for I := 1 to 10 do
   begin
      troca :='';
      pos := 0;
      for j := I to 10 do
      begin
      end;
   end;
end;
procedure TForm5.EditNomeExit(Sender: TObject);
var
   FIndice : integer;
begin
   FIndice := Duplicidade(EditNome.Text);
   if (FIndice > 0) then
   begin
      BtnExcluir.Enabled := True;
      EditIdade.Text := FMulti[FIndice][2];
      EditEmail.Text := FMulti[FIndice][3];
      if (FMulti[FIndice][4] =  'FEMININO') then
      begin
         (RadioSexo.ItemIndex := 0)
      end
      else
         (RadioSexo.ItemIndex := 1);
         MemoObservacao.Lines.Clear;
         MemoObservacao.Lines.Add(FMulti[FIndice][5]);
   end;
end;
procedure TForm5.FormCreate(Sender: TObject);
begin
   Contar := 0;
end;
procedure TForm5.PageControl1Change(Sender: TObject);
begin
   if (PageControl1.TabIndex = 1) then
   begin
      BtnCadastrar.Enabled := False;
      BtnExcluir.Enabled := False;
   end;
   if (PageControl1.TabIndex = 0) then
   begin
      BtnCadastrar.Enabled := True;
      BtnExcluir.Enabled := True;
   end;
end;
function TForm5.RemoveEspaco(const Vago: string): string;
const
   Espaço = ' ';
   Vazio = '';
begin
   result := Vago;
   while pos(Espaço,result) > 0 do
      result := StringReplace(result,Espaço,Vazio,[rfReplaceAll]);
end;
end.

