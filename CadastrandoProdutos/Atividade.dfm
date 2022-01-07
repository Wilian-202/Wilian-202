object Form5: TForm5
  Left = 204
  Top = 159
  Caption = 'Cadastro de Produtos'
  ClientHeight = 497
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 760
    Top = 407
    Width = 137
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 904
    Height = 401
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 1
      ExplicitTop = 28
      object Label1: TLabel
        Left = 156
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object Label2: TLabel
        Left = 378
        Top = 14
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label3: TLabel
        Left = 586
        Top = 14
        Width = 64
        Height = 13
        Caption = 'Valor Unit'#225'rio'
      end
      object Label5: TLabel
        Left = 3
        Top = 14
        Width = 78
        Height = 13
        Caption = 'Nome do Cliente'
      end
      object Label6: TLabel
        Left = 3
        Top = 62
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label7: TLabel
        Left = 3
        Top = 104
        Width = 58
        Height = 13
        Caption = 'Data e Hora'
      end
      object BtnAdicionar: TButton
        Left = 756
        Top = 33
        Width = 137
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 4
        OnClick = BtnAdicionarClick
      end
      object EDT_NOME: TEdit
        Left = 3
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object EDT_COD: TEdit
        Left = 3
        Top = 77
        Width = 121
        Height = 21
        Color = clWhite
        TabOrder = 5
      end
      object EDT_DATA: TEdit
        Left = 3
        Top = 123
        Width = 121
        Height = 21
        Color = clWhite
        TabOrder = 7
      end
      object StringGrid1: TStringGrid
        Left = 156
        Top = 62
        Width = 573
        Height = 308
        ColCount = 4
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 8
        OnDblClick = StringGrid1DblClick
      end
      object EDT_PRODUTO: TEdit
        Left = 156
        Top = 35
        Width = 205
        Height = 21
        TabOrder = 1
      end
      object EDT_QUANTIDADE: TEdit
        Left = 378
        Top = 35
        Width = 191
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object EDT_VALOR_UNITARIO: TEdit
        Left = 586
        Top = 35
        Width = 143
        Height = 21
        TabOrder = 3
      end
      object BitBtn2: TBitBtn
        Left = 756
        Top = 345
        Width = 137
        Height = 25
        Caption = 'Finalizar Compra'
        TabOrder = 6
        OnClick = BitBtn2Click
      end
      object BtnAlterar: TButton
        Left = 756
        Top = 64
        Width = 137
        Height = 25
        Caption = 'Alterar'
        TabOrder = 9
        OnClick = BtnAlterarClick
      end
      object BtnHome: TButton
        Left = 0
        Top = 345
        Width = 137
        Height = 25
        Caption = 'HOME'
        TabOrder = 10
        OnClick = BtnHomeClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object StringGrid2: TStringGrid
        Left = 0
        Top = 3
        Width = 521
        Height = 338
        ColCount = 4
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid2DblClick
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 48
    Top = 216
  end
end
