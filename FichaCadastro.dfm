object Form5: TForm5
  Left = 243
  Top = 130
  Caption = 'Form5'
  ClientHeight = 430
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    912
    430)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 361
    ActivePage = TabCadastro
    Align = alTop
    TabOrder = 0
    OnChange = PageControl1Change
    ExplicitLeft = -48
    ExplicitTop = -4
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 8
      object Label3: TLabel
        Left = 3
        Top = 207
        Width = 65
        Height = 16
        Caption = 'Profiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 3
        Top = 47
        Width = 40
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 234
        Top = 47
        Width = 42
        Height = 16
        Caption = 'Idade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 3
        Top = 96
        Width = 43
        Height = 16
        Caption = 'E-mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 3
        Top = 3
        Width = 369
        Height = 38
        Caption = 'FICHA DE CADASTRO'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object EditNome: TEdit
        Left = 3
        Top = 69
        Width = 225
        Height = 21
        TabOrder = 0
        TextHint = 'Insira o seu nome'
        OnEnter = EditNomeEnter
        OnExit = EditNomeExit
      end
      object EditIdade: TEdit
        Left = 234
        Top = 69
        Width = 137
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        TextHint = 'Insira sua idade'
      end
      object EditEmail: TEdit
        Left = 3
        Top = 118
        Width = 369
        Height = 21
        TabOrder = 2
        TextHint = 'Insira o seu e-mail'
      end
      object RadioSexo: TRadioGroup
        Left = -1
        Top = 145
        Width = 372
        Height = 56
        Caption = 'Sexo:'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'FEMININO'
          'MASCULINO')
        ParentFont = False
        TabOrder = 3
      end
      object MemoObservacao: TMemo
        Left = 3
        Top = 229
        Width = 368
        Height = 44
        TabOrder = 4
      end
    end
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      ExplicitLeft = 0
      object GridConsulta: TStringGrid
        Left = 0
        Top = 0
        Width = 904
        Height = 311
        Align = alTop
        TabOrder = 0
        ExplicitLeft = -3
        ExplicitTop = -6
      end
      object BtnOrdem: TButton
        Left = 0
        Top = 311
        Width = 75
        Height = 23
        Caption = 'Decrescente'
        TabOrder = 1
        OnClick = BtnDecrescenteClick
      end
      object BtnCrescente: TButton
        Left = 73
        Top = 311
        Width = 75
        Height = 23
        Caption = 'Crescente'
        TabOrder = 2
        OnClick = BtnCrescenteClick
      end
    end
  end
  object BtnCadastrar: TButton
    Left = 633
    Top = 363
    Width = 89
    Height = 65
    Anchors = [akRight, akBottom]
    Caption = 'CADASTRAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnCadastrarClick
  end
  object BtnClose: TBitBtn
    Left = 823
    Top = 363
    Width = 89
    Height = 65
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object BtnExcluir: TButton
    Left = 728
    Top = 363
    Width = 89
    Height = 65
    Anchors = [akRight, akBottom]
    Caption = 'EXCLUIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnExcluirClick
  end
end
