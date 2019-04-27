inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Firedac Services'
  ClientHeight = 559
  ClientWidth = 554
  ExplicitWidth = 570
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 548
    Height = 553
    ExplicitWidth = 548
    ExplicitHeight = 553
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 540
      ExplicitHeight = 525
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 540
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object BtnRestore: TSpeedButton
          AlignWithMargins = True
          Left = 142
          Top = 3
          Width = 133
          Height = 35
          Align = alLeft
          Caption = 'Restore'
          OnClick = BtnRestoreClick
        end
        object BtnBackup: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 133
          Height = 35
          Align = alLeft
          Caption = 'Backup'
          OnClick = BtnBackupClick
        end
        object BtnValidate: TSpeedButton
          AlignWithMargins = True
          Left = 404
          Top = 3
          Width = 133
          Height = 35
          Align = alRight
          Caption = 'Validate'
          OnClick = BtnValidateClick
        end
      end
      object Memo1: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 534
        Height = 478
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 540
      ExplicitHeight = 525
      inherited GbxPostgreSQL: TGroupBox
        Width = 534
        ExplicitWidth = 534
      end
      inherited GbxFirebird: TGroupBox
        Width = 534
        ExplicitWidth = 534
      end
      inherited PnlBotton: TPanel
        Top = 484
        Width = 540
        ExplicitTop = 484
        ExplicitWidth = 540
        inherited BtnSalvarConfiguracoes: TSpeedButton
          Left = 433
          ExplicitLeft = 433
        end
      end
    end
  end
  inherited OpenDialog1: TOpenDialog
    DefaultExt = '*.fdb'
    Filter = 'Arquivos de bancos de dados Firebird|*.fdb'
    Left = 100
    Top = 185
  end
  object FDFBNBackup1: TFDFBNBackup
    OnError = FDFBNBackup1Error
    BeforeExecute = FDFBNBackup1BeforeExecute
    AfterExecute = FDFBNBackup1AfterExecute
    DriverLink = FDPhysFBDriverLink1
    OnProgress = FDFBNBackup1Progress
    Left = 97
    Top = 292
  end
  object FDFBOnlineValidate1: TFDFBOnlineValidate
    OnError = FDFBOnlineValidate1Error
    BeforeExecute = FDFBOnlineValidate1BeforeExecute
    AfterExecute = FDFBOnlineValidate1AfterExecute
    DriverLink = FDPhysFBDriverLink1
    OnProgress = FDFBOnlineValidate1Progress
    Left = 97
    Top = 392
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 220
    Top = 290
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.fbk'
    Filter = 'Backup de banco de dados|*.fbk'
    Title = 'Salvar arquivo'
    Left = 180
    Top = 185
  end
  object FDFBNRestore1: TFDFBNRestore
    OnError = FDFBNRestore1Error
    BeforeExecute = FDFBNRestore1BeforeExecute
    AfterExecute = FDFBNRestore1AfterExecute
    DriverLink = FDPhysFBDriverLink1
    OnProgress = FDFBNRestore1Progress
    Left = 97
    Top = 342
  end
end
