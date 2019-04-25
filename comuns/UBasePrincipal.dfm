object FrmBasePrincipal: TFrmBasePrincipal
  Left = 0
  Top = 0
  Caption = 'Demo'
  ClientHeight = 626
  ClientWidth = 949
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
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 943
    Height = 620
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    TabWidth = 150
    object TabSheet1: TTabSheet
      Caption = 'Principal'
    end
    object TabSheet2: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      object Label1: TLabel
        Left = 20
        Top = 19
        Width = 40
        Height = 13
        Caption = 'Servidor'
      end
      object Label2: TLabel
        Left = 20
        Top = 62
        Width = 26
        Height = 13
        Caption = 'Porta'
      end
      object Label3: TLabel
        Left = 20
        Top = 105
        Width = 41
        Height = 13
        Caption = 'Caminho'
      end
      object BtnSalvarConfiguracoes: TSpeedButton
        Left = 411
        Top = 209
        Width = 104
        Height = 31
        Caption = 'Salvar'
        OnClick = BtnSalvarConfiguracoesClick
      end
      object BtnProcurarBancoLocal: TSpeedButton
        Left = 492
        Top = 120
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = BtnProcurarBancoLocalClick
      end
      object EdtBancoCaminho: TEdit
        Left = 20
        Top = 121
        Width = 466
        Height = 21
        TabOrder = 2
      end
      object EdtBancoServidor: TEdit
        Left = 20
        Top = 35
        Width = 151
        Height = 21
        TabOrder = 0
        Text = 'localhost'
      end
      object EdtBancoPorta: TEdit
        Left = 20
        Top = 78
        Width = 69
        Height = 21
        MaxLength = 4
        NumbersOnly = True
        TabOrder = 1
        Text = '3050'
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.fdb'
    Filter = 'Bancos de dados Firebird|*.fdb'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Abrir arquivo'
    Left = 740
    Top = 155
  end
end
