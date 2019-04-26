inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Pool Conex'#245'es'
  ClientHeight = 420
  ClientWidth = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 547
    Height = 414
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
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
      inherited GbxPostgreSQL: TGroupBox
        Width = 533
      end
      inherited GbxFirebird: TGroupBox
        Width = 533
      end
      inherited PnlBotton: TPanel
        Top = 345
        Width = 539
        inherited BtnSalvarConfiguracoes: TSpeedButton
          Left = 432
        end
      end
    end
  end
  inherited OpenDialog1: TOpenDialog
    Left = 370
    Top = 80
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 270
    Top = 215
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 280
    Top = 225
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 290
    Top = 235
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 300
    Top = 245
  end
end
