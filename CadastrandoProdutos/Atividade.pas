unit Atividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnAdicionar: TButton;
    Label5: TLabel;
    EDT_NOME: TEdit;
    EDT_COD: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EDT_DATA: TEdit;
    Timer1: TTimer;
    StringGrid1: TStringGrid;
    EDT_PRODUTO: TEdit;
    EDT_QUANTIDADE: TEdit;
    EDT_VALOR_UNITARIO: TEdit;
    BitBtn2: TBitBtn;
    StringGrid2: TStringGrid;
    BtnAlterar: TButton;
    BtnHome: TButton;
    procedure Timer1Timer(Sender: TObject);
    function RemoveEspaco(Nome : string) : string;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    function Duplicidade(checar : string) : integer;
    procedure BtnAlterarClick(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure Limpando;
    procedure AdicionarAlterarProduto(index: Integer);
    procedure BtnHomeClick(Sender: TObject);
  private
    procedure LimparGrid;

  public

  end;
var
   Form5 : TForm5;
   FarraMultItensVenda : array[1..100,1..5]of string;
   FarraMultVenda : array[1..100,1..4]of string;
   RCB_CODIGO : integer;
   Tempo : string;
const
   CNT_PRODUTO = 0;
   CNT_QUANTIDADE = 1;
   CNT_VALORUNITARIO = 2;
   CNT_VALORTOTAL = 3;
implementation

{$R *.dfm}

//click do botão finilizar
procedure TForm5.BitBtn2Click(Sender: TObject);
var
   I, A, B,z : Integer;
   VALOR_TOTAL : Currency;
begin
   if ((EDT_NOME.Text) = '') then
   begin
      MessageDlg('Por favor, Insira o nome do cliente',mtError,[mbOK],0);
      exit;
   end;
   B := CNT_PRODUTO;
   for A := 1 to High(FarraMultItensVenda) do
   begin
      if (FarraMultItensVenda[A, 1] ='') then
      begin
         for I := A to (Pred(StringGrid1.RowCount)+A)-1 do
         begin
            Inc(B);
            FarraMultItensVenda[I, 2] := StringGrid1.Cells[CNT_PRODUTO,B];
            FarraMultItensVenda[I, 3] := StringGrid1.Cells[CNT_QUANTIDADE,B];
            FarraMultItensVenda[I, 4] := StringGrid1.Cells[CNT_VALORUNITARIO,B];
            FarraMultItensVenda[I, 5] := StringGrid1.Cells[CNT_VALORTOTAL,B];
            VALOR_TOTAL:= VALOR_TOTAL + StrToCurr(FarraMultItensVenda[I,5]);
            FarraMultItensVenda[I, 1] := IntToStr(RCB_CODIGO);
         end;
         break;
      end;
   end;
   if (StringGrid2.Cells[CNT_PRODUTO, StringGrid2.RowCount-1])<>'' then
   begin
      StringGrid2.RowCount := StringGrid2.RowCount + CNT_QUANTIDADE;
   end;
   StringGrid2.Cells[0, RCB_CODIGO] := IntToStr(RCB_CODIGO);
   StringGrid2.Cells[1, RCB_CODIGO] := EDT_NOME.Text;
   StringGrid2.Cells[2, RCB_CODIGO] := tempo;
   StringGrid2.Cells[3, RCB_CODIGO] := CurrToStr(VALOR_TOTAL);
   FarraMultVenda[RCB_CODIGO,1] := StringGrid2.Cells[0, RCB_CODIGO];
   FarraMultVenda[RCB_CODIGO,2] := StringGrid2.Cells[1, RCB_CODIGO];
   FarraMultVenda[RCB_CODIGO,3] := StringGrid2.Cells[2, RCB_CODIGO];
   FarraMultVenda[RCB_CODIGO,4] := StringGrid2.Cells[3, RCB_CODIGO];
   MessageDlg('Compra Realizada com Sucesso!', mtConfirmation, [mbOK],0);
   LimparGrid;
   EDT_NOME.Clear;
   EDT_COD.Clear;
   Inc(RCB_CODIGO);
   //StringGrid1.RowCount := 2;
   BtnHome.Enabled := false;
end;
//click do botão adicionar
procedure TForm5.BtnAdicionarClick(Sender: TObject);
var
   I, index, RCB_VERIFICA_PRODUTO : Integer;
begin
   edt_cod.Enabled := true;
   if (trim(EDT_PRODUTO.Text) = '') or (trim(EDT_QUANTIDADE.Text) = '') or (trim(EDT_VALOR_UNITARIO.Text) = '')then
   begin
      MessageDlg('Por favor, preencha os campos',mtError,[mbOK],0);
      exit;
   end;
   if (StringGrid1.Cells[CNT_PRODUTO, StringGrid1.RowCount-CNT_QUANTIDADE] <> '') then
   begin
      StringGrid1.RowCount :=  StringGrid1.RowCount + CNT_QUANTIDADE;
      index:= Pred(StringGrid1.RowCount);
   end
   else
      index := CNT_QUANTIDADE;
   StringGrid1.Cells[CNT_PRODUTO, index] := UpperCase(EDT_PRODUTO.Text);
   AdicionarAlterarProduto(index);
   RCB_VERIFICA_PRODUTO:= Duplicidade(EDT_PRODUTO.Text);
   EDT_COd.Enabled := false;
   BtnHome.Enabled := false;
   Limpando;
end;
//Alterar os dados do produto
procedure TForm5.BtnAlterarClick(Sender: TObject);
var
   RCB_INDEX_EXISTENTE : Integer;
begin
   RCB_INDEX_EXISTENTE := Duplicidade(EDT_PRODUTO.Text);
   if (RCB_INDEX_EXISTENTE = -1) then
      MessageDlg('Produto não encontrado',mtError,[mbOK],0);

   AdicionarAlterarProduto(RCB_INDEX_EXISTENTE);
   EDT_PRODUTO.Enabled := true;
   BtnAdicionar.Enabled := true;
   Limpando;
   BtnAlterar.Enabled := false;
end;
procedure TForm5.BtnHomeClick(Sender: TObject);
begin
   EDT_NOME.Clear;
   EDT_COD.Clear;
   EDT_VALOR_UNITARIO.Clear;
   EDT_PRODUTO.Enabled := True;
   EDT_QUANTIDADE.Enabled := True;
   EDT_VALOR_UNITARIO.Enabled := true;
   EDT_NOME.Enabled := true;
   BtnAdicionar.Enabled := true;
   EDT_COD.Enabled := false ;
   LimparGrid;
end;
//Limpar os campos digitados
procedure TForm5.Limpando;
begin
   EDT_PRODUTO.Clear;
   EDT_QUANTIDADE.Clear;
   EDT_VALOR_UNITARIO.Clear;
   EDT_PRODUTO.SetFocus;
end;
//Adicionando e Alterando Produtos
procedure TForm5.AdicionarAlterarProduto(index: Integer);
begin
   StringGrid1.Cells[CNT_QUANTIDADE, index] := EDT_QUANTIDADE.Text;
   StringGrid1.Cells[CNT_VALORUNITARIO, index] := EDT_VALOR_UNITARIO.Text;
   StringGrid1.Cells[CNT_VALORTOTAL, index] := CurrToStr(StrToCurr(StringGrid1.Cells[CNT_QUANTIDADE, index])
                                               * StrToCurr(StringGrid1.Cells[CNT_VALORUNITARIO, index]));
end;
//Limpar a grid após clicar em Finalizar
procedure TForm5.LimparGrid;
var
  Apagar: Integer;
begin
  with StringGrid1 do
    for Apagar := 1 to Pred(StringGrid1.RowCount) do
    begin
      StringGrid1.Rows[Apagar].Clear;
      StringGrid1.RowCount := 1;
    end;
end;
//Confere para ver se é igual
function TForm5.Duplicidade(checar: string): integer;
var
   I : integer;
begin
   Result := -1;
   checar := RemoveEspaco(checar);
   for I := 1 to 10 do
   begin
      if (UpperCase(trim(checar))) = UpperCase(trim(StringGrid1.Cells[CNT_PRODUTO, I]))  then
      begin
         Result := (I);
         break;
      end;
   end;
end;
//instancia valores na criação do formulario
procedure TForm5.FormCreate(Sender: TObject);
begin
   EDT_COD.Visible := false;
   EDT_DATA.Visible := false;
   label6.Visible := false;
   label7.Visible := false;
   RCB_CODIGO := 1;
   EDT_COD.Enabled := false;
   BtnAlterar.Enabled := false;
   EDT_DATA.Enabled := False;
   BtnHome.Enabled := false;

   StringGrid1.Cells[CNT_PRODUTO, 0] := 'Produto';
   StringGrid1.Cells[CNT_QUANTIDADE, 0] := 'Quantidade';
   StringGrid1.Cells[CNT_VALORUNITARIO, 0] := 'Valor Unitario';
   StringGrid1.Cells[CNT_VALORTOTAL, 0] := 'Valor Total';
   StringGrid1.ColWidths[CNT_PRODUTO] := 200;
   StringGrid1.ColWidths[CNT_QUANTIDADE] := 70;
   StringGrid1.ColWidths[CNT_VALORUNITARIO] := 145;
   StringGrid1.ColWidths[CNT_VALORTOTAL] := 150;

   StringGrid2.Cells[0, 0] := 'Codigo';
   StringGrid2.Cells[1, 0] := 'Nome do cliente';
   StringGrid2.Cells[2, 0] := 'Data e Hora';
   StringGrid2.Cells[3, 0] := 'Valor total';
   StringGrid2.ColWidths[0] := 53;
   StringGrid2.ColWidths[1] := 200;
   StringGrid2.ColWidths[2] := 170;
   StringGrid2.ColWidths[3] := 90;
end;
//função para tirar espacoes em branco
function TForm5.RemoveEspaco(Nome: string): string;
const
   vazio = '';
   espaco = ' ';
begin
   Result:= StringReplace(Nome,espaco,vazio,[rfReplaceAll]);
end;
//dois click para abri produtos na stringrid
procedure TForm5.StringGrid1DblClick(Sender: TObject);
begin
   BtnAdicionar.Enabled:= false;
   EDT_PRODUTO.Enabled:= false;
   BtnAlterar.Enabled:= true;

   if (StringGrid1.Row <> 0) then
   begin
      EDT_PRODUTO.Text:= StringGrid1.Cells[CNT_PRODUTO,StringGrid1.Row];
   end;
   if (StringGrid1.Row <> 0) then
   begin
      EDT_QUANTIDADE.Text:= StringGrid1.Cells[CNT_QUANTIDADE,StringGrid1.Row];
   end;
   if (StringGrid1.Row <> 0) then
   begin
      EDT_VALOR_UNITARIO.Text:= StringGrid1.Cells[CNT_VALORUNITARIO,StringGrid1.Row];
   end;
end;
//Dois Clicks para abrir o Código da Consulta
procedure TForm5.StringGrid2DblClick(Sender: TObject);
var
   I, J : integer;
begin
   EDT_COD.Visible := true;
   EDT_DATA.Visible := true;
   label6.Visible := true;
   label7.Visible := true;
   BtnHome.Enabled := True;
   EDT_COD.Color := clWhite;
   EDT_DATA.Color := clWhite;
   EDT_NOME.ColoR := clWhite;
   TabSheet1.Show;
   LimparGrid;
   J := 1;
   BtnAdicionar.Enabled := false;
   EDT_PRODUTO.Enabled := False;
   EDT_QUANTIDADE.Enabled := false;
   EDT_VALOR_UNITARIO.Enabled := false;
   EDT_NOME.Enabled := false;
   EDT_COD.Text := FarraMultVenda[StringGrid2.Row,1];
   EDT_NOME.Text := FarraMultVenda[StringGrid2.Row,2];
   EDT_DATA.Text := FarraMultVenda[StringGrid2.Row,3];
   EDT_VALOR_UNITARIO.Text := FarraMultVenda[StringGrid2.Row,4];
   for I := 1 to High(FarraMultVenda) do
   begin
      if (FarraMultVenda[StringGrid2.Row,1] = FarraMultItensVenda[I,1]) then
      begin
         if (StringGrid1.Cells[CNT_PRODUTO, StringGrid1.RowCount-1] <>'') then
            StringGrid1.RowCount := StringGrid1.RowCount + 1;
         StringGrid1.Cells[CNT_PRODUTO, J] := FarraMultItensVenda[I,2];
         StringGrid1.Cells[CNT_QUANTIDADE, J] := FarraMultItensVenda[I,3];
         StringGrid1.Cells[CNT_VALORUNITARIO, J] := FarraMultItensVenda[I,4];
         StringGrid1.Cells[CNT_VALORTOTAL, J] := FarraMultItensVenda[I,5];
         Inc(J);
      end;
   end;
   EDT_VALOR_UNITARIO.Clear;
end;
//Data e Hora Att
procedure TForm5.Timer1Timer(Sender: TObject);
begin
   Tempo:= DateTimeToStr(now);
end;
end.
