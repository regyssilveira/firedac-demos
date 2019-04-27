inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Pool Conex'#245'es'
  ClientHeight = 420
  ClientWidth = 553
  ExplicitWidth = 569
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 547
    Height = 414
    ExplicitWidth = 547
    ExplicitHeight = 414
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 539
      ExplicitHeight = 386
      object btnExecucaoThread: TButton
        Left = 20
        Top = 20
        Width = 176
        Height = 41
        Caption = 'Dentro de Thread'
        TabOrder = 0
        OnClick = btnExecucaoThreadClick
      end
      object btnExecucaoNormal: TButton
        Left = 20
        Top = 80
        Width = 176
        Height = 41
        Caption = 'Normal'
        TabOrder = 1
        OnClick = btnExecucaoNormalClick
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 539
      ExplicitHeight = 386
      inherited GbxPostgreSQL: TGroupBox
        Width = 533
        ExplicitWidth = 533
      end
      inherited GbxFirebird: TGroupBox
        Width = 533
        ExplicitWidth = 533
      end
      inherited PnlBotton: TPanel
        Top = 345
        Width = 539
        ExplicitTop = 345
        ExplicitWidth = 539
        inherited BtnSalvarConfiguracoes: TSpeedButton
          Left = 432
          ExplicitLeft = 432
        end
      end
    end
  end
  inherited OpenDialog1: TOpenDialog
    Left = 370
    Top = 80
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 260
    Top = 230
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 330
    Top = 160
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 370
    Top = 225
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 300
  end
end
