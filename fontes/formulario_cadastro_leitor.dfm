object FormularioCadastroLeitor: TFormularioCadastroLeitor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Leitores'
  ClientHeight = 333
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object GrupoRegistro: TGroupBox
    Left = 8
    Top = 8
    Width = 550
    Height = 300
    Caption = 'Registro'
    TabOrder = 0
    object TextoCodigo: TLabel
      Left = 25
      Top = 25
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
    end
    object TextoNome: TLabel
      Left = 25
      Top = 77
      Width = 33
      Height = 16
      Caption = 'Nome'
    end
    object TextoEndereco: TLabel
      Left = 25
      Top = 129
      Width = 53
      Height = 16
      Caption = 'Endere'#231'o'
    end
    object TextoTelefone: TLabel
      Left = 25
      Top = 181
      Width = 50
      Height = 16
      Caption = 'Telefone'
    end
    object TextoCpf: TLabel
      Left = 201
      Top = 181
      Width = 22
      Height = 16
      Caption = 'CPF'
    end
    object TextoDataNascimento: TLabel
      Left = 376
      Top = 181
      Width = 114
      Height = 16
      Caption = 'Data de Nascimento'
    end
    object TextoEstadoCivil: TLabel
      Left = 25
      Top = 233
      Width = 65
      Height = 16
      Caption = 'Estado Civil'
    end
    object TextoEscolaridade: TLabel
      Left = 201
      Top = 233
      Width = 72
      Height = 16
      Caption = 'Escolaridade'
    end
    object TextoAtivo: TLabel
      Left = 376
      Top = 233
      Width = 28
      Height = 16
      Caption = 'Ativo'
    end
    object CampoCodigo: TEdit
      Left = 25
      Top = 47
      Width = 100
      Height = 24
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object CampoNome: TEdit
      Left = 25
      Top = 99
      Width = 500
      Height = 24
      TabOrder = 1
    end
    object CampoEndereco: TEdit
      Left = 25
      Top = 151
      Width = 500
      Height = 24
      TabOrder = 2
    end
    object CampoDataNascimento: TMaskEdit
      Left = 376
      Top = 203
      Width = 98
      Height = 24
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 5
      Text = '  /  /    '
    end
    object CampoTelefone: TMaskEdit
      Left = 25
      Top = 203
      Width = 125
      Height = 24
      EditMask = '!\(99\) 99999-9999;0; '
      MaxLength = 15
      TabOrder = 3
      Text = ''
    end
    object CampoCpf: TMaskEdit
      Left = 201
      Top = 203
      Width = 125
      Height = 24
      EditMask = '999\.999\.999\-99;0; '
      MaxLength = 14
      TabOrder = 4
      Text = ''
    end
    object CampoEstadoCivil: TComboBox
      Left = 25
      Top = 255
      Width = 125
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'N'#227'o Informado'
      Items.Strings = (
        'N'#227'o Informado'
        'Solteiro'
        'Casado'
        'Separado'
        'Divorciado'
        'Vi'#250'vo')
    end
    object CampoEscolaridade: TComboBox
      Left = 201
      Top = 255
      Width = 125
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 7
      Text = 'N'#227'o Informada'
      Items.Strings = (
        'N'#227'o Informada'
        'Fundamental'
        'M'#233'dio'
        'Superior')
    end
    object CampoAtivo: TComboBox
      Left = 376
      Top = 255
      Width = 125
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 8
      Text = 'N'#227'o'
      Items.Strings = (
        'N'#227'o'
        'Sim')
    end
  end
  object GrupoAcoes: TGroupBox
    Left = 562
    Top = 8
    Width = 150
    Height = 300
    Caption = 'A'#231#245'es'
    TabOrder = 1
    object BotaoIncluir: TBitBtn
      Left = 25
      Top = 25
      Width = 100
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BotaoIncluirClick
    end
    object BotaoSalvar: TBitBtn
      Left = 25
      Top = 56
      Width = 100
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = BotaoSalvarClick
    end
    object BotaoCancelar: TBitBtn
      Left = 25
      Top = 87
      Width = 100
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = BotaoCancelarClick
    end
    object BotaoConsultar: TBitBtn
      Left = 25
      Top = 118
      Width = 100
      Height = 25
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = BotaoConsultarClick
    end
    object BotaoEditar: TBitBtn
      Left = 25
      Top = 149
      Width = 100
      Height = 25
      Caption = 'Editar'
      TabOrder = 4
      OnClick = BotaoEditarClick
    end
    object BotaoExcluir: TBitBtn
      Left = 25
      Top = 180
      Width = 100
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = BotaoExcluirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 314
    Width = 720
    Height = 19
    Panels = <>
  end
end
