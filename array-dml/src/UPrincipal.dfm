inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Array DML'
  ClientWidth = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 553
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      object Label4: TLabel
        Left = 20
        Top = 19
        Width = 154
        Height = 13
        Caption = 'Quantidade de itens para inserir'
      end
      object BtnInsercaoNormal: TButton
        Left = 367
        Top = 19
        Width = 154
        Height = 25
        Caption = 'Inser'#231#227'o Normal'
        TabOrder = 0
        OnClick = BtnInsercaoNormalClick
      end
      object BtnInsercaoArrayDML: TButton
        Left = 367
        Top = 50
        Width = 154
        Height = 25
        Caption = 'Inser'#231#227'o via ArrayDML'
        TabOrder = 2
        OnClick = BtnInsercaoArrayDMLClick
      end
      object edtQuantidadeItens: TSpinEdit
        Left = 20
        Top = 35
        Width = 161
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 10000
      end
      object Memo1: TMemo
        Left = 3
        Top = 100
        Width = 533
        Height = 489
        TabOrder = 3
      end
    end
  end
end
