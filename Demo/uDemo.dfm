object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 149
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 312
    Height = 25
    Caption = 'Componente TEventoLog - DEMO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtCodigo: TEdit
    Left = 32
    Top = 56
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '12'
  end
  object edtNome: TEdit
    Left = 91
    Top = 56
    Width = 289
    Height = 21
    TabOrder = 1
    Text = ' Alexandre S. Santos'
  end
  object Button1: TButton
    Left = 91
    Top = 104
    Width = 89
    Height = 25
    Caption = 'GerarLog'
    TabOrder = 2
    OnClick = Button1Click
  end
  object EventoLog1: TEventoLog
    ArquivoLog = 'Log_demo'
    Cabecalho = 'Log de teste iniciado em'
    Left = 216
    Top = 104
  end
end
