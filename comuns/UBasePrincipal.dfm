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
      object GbxPostgreSQL: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 172
        Width = 929
        Height = 167
        Align = alTop
        Caption = 'PostgreSQL'
        TabOrder = 1
        Visible = False
        object Label4: TLabel
          Left = 25
          Top = 24
          Width = 40
          Height = 13
          Caption = 'Servidor'
        end
        object Label6: TLabel
          Left = 24
          Top = 110
          Width = 41
          Height = 13
          Caption = 'Caminho'
        end
        object SpeedButton2: TSpeedButton
          Left = 497
          Top = 125
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = BtnProcurarBancoLocalClick
        end
        object Label7: TLabel
          Left = 24
          Top = 67
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label8: TLabel
          Left = 182
          Top = 67
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object Label5: TLabel
          Left = 182
          Top = 24
          Width = 26
          Height = 13
          Caption = 'Porta'
        end
        object EdtPGCaminho: TEdit
          Left = 25
          Top = 126
          Width = 466
          Height = 21
          TabOrder = 4
        end
        object EdtPGServidor: TEdit
          Left = 25
          Top = 40
          Width = 151
          Height = 21
          TabOrder = 0
          Text = 'localhost'
        end
        object EdtPGPorta: TEdit
          Left = 182
          Top = 40
          Width = 151
          Height = 21
          MaxLength = 4
          NumbersOnly = True
          TabOrder = 1
          Text = '3050'
        end
        object EdtPGUsuario: TEdit
          Left = 24
          Top = 83
          Width = 152
          Height = 21
          TabOrder = 2
        end
        object EdtPGSenha: TEdit
          Left = 182
          Top = 83
          Width = 151
          Height = 21
          TabOrder = 3
        end
      end
      object GbxFirebird: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 929
        Height = 163
        Align = alTop
        Caption = 'Servidor Firebird'
        TabOrder = 0
        object Label1: TLabel
          Left = 17
          Top = 24
          Width = 40
          Height = 13
          Caption = 'Servidor'
        end
        object Label2: TLabel
          Left = 174
          Top = 24
          Width = 26
          Height = 13
          Caption = 'Porta'
        end
        object Label3: TLabel
          Left = 17
          Top = 110
          Width = 41
          Height = 13
          Caption = 'Caminho'
        end
        object BtnProcurarBancoLocal: TSpeedButton
          Left = 489
          Top = 125
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = BtnProcurarBancoLocalClick
        end
        object Label9: TLabel
          Left = 17
          Top = 67
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label10: TLabel
          Left = 175
          Top = 67
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object EdtFBCaminho: TEdit
          Left = 17
          Top = 126
          Width = 466
          Height = 21
          TabOrder = 4
        end
        object EdtFBServidor: TEdit
          Left = 17
          Top = 40
          Width = 151
          Height = 21
          TabOrder = 0
          Text = 'localhost'
        end
        object EdtFBPorta: TEdit
          Left = 174
          Top = 40
          Width = 152
          Height = 21
          MaxLength = 4
          NumbersOnly = True
          TabOrder = 1
          Text = '3050'
        end
        object EdtFBUsuario: TEdit
          Left = 17
          Top = 83
          Width = 152
          Height = 21
          TabOrder = 2
        end
        object EdtFBSenha: TEdit
          Left = 175
          Top = 83
          Width = 151
          Height = 21
          TabOrder = 3
        end
      end
      object PnlBotton: TPanel
        Left = 0
        Top = 551
        Width = 935
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object BtnSalvarConfiguracoes: TSpeedButton
          AlignWithMargins = True
          Left = 828
          Top = 3
          Width = 104
          Height = 35
          Align = alRight
          Caption = 'Salvar'
          OnClick = BtnSalvarConfiguracoesClick
        end
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
