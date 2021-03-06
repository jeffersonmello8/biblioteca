object FormularioConsultaLeitor: TFormularioConsultaLeitor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Leitores'
  ClientHeight = 371
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object GrupoFiltros: TGroupBox
    Left = 8
    Top = 8
    Width = 578
    Height = 100
    Caption = 'Filtros'
    TabOrder = 0
    object TextoNomeCpf: TLabel
      Left = 25
      Top = 25
      Width = 185
      Height = 16
      Caption = 'Digite o nome ou o CPF do leitor'
    end
    object CampoNomeCpf: TEdit
      Left = 25
      Top = 47
      Width = 400
      Height = 24
      TabOrder = 0
      OnKeyDown = CampoNomeCpfKeyDown
    end
    object BotaoConsultar: TBitBtn
      Left = 431
      Top = 47
      Width = 100
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = BotaoConsultarClick
    end
  end
  object GrupoResultado: TGroupBox
    Left = 8
    Top = 114
    Width = 578
    Height = 232
    Caption = 'Resultado da consulta'
    TabOrder = 1
    object ListaLeitores: TListView
      Left = 10
      Top = 24
      Width = 558
      Height = 196
      Columns = <
        item
          Caption = 'C'#243'digo'
          MaxWidth = 100
          MinWidth = 100
          Width = 100
        end
        item
          Caption = 'Nome'
          MaxWidth = 300
          MinWidth = 300
          Width = 300
        end
        item
          Caption = 'CPF'
          MaxWidth = 150
          MinWidth = 150
          Width = 150
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListaLeitoresDblClick
    end
  end
  object BarraStatus: TStatusBar
    Left = 0
    Top = 352
    Width = 594
    Height = 19
    Panels = <>
    ExplicitLeft = 416
    ExplicitTop = 296
    ExplicitWidth = 0
  end
end
