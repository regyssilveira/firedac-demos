inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Data Mapping'
  ClientHeight = 654
  ClientWidth = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 542
    Height = 648
    inherited TabSheet1: TTabSheet
      object Button1: TButton
        Left = 25
        Top = 35
        Width = 246
        Height = 41
        Caption = 'Sem Data Mapping'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 25
        Top = 82
        Width = 246
        Height = 41
        Caption = 'Com Data Mapping'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Memo1: TMemo
        Left = 25
        Top = 140
        Width = 476
        Height = 420
        Lines.Strings = (
          'Memo1')
        TabOrder = 2
      end
      object Button3: TButton
        Left = 385
        Top = 566
        Width = 116
        Height = 25
        Caption = 'Limpar memo'
        TabOrder = 3
        OnClick = Button3Click
      end
    end
    inherited TabSheet2: TTabSheet
      inherited GbxPostgreSQL: TGroupBox
        Width = 528
      end
      inherited GbxFirebird: TGroupBox
        Width = 528
      end
      inherited PnlBotton: TPanel
        Top = 579
        Width = 534
        inherited BtnSalvarConfiguracoes: TSpeedButton
          Left = 427
        end
      end
    end
  end
  object QryNumeros: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    SQL.Strings = (
      'select * from TESTE_NUMEROS')
    Left = 375
    Top = 90
  end
end
