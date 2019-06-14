inherited FrmBasePrincipal1: TFrmBasePrincipal1
  Caption = 'Demo SQL Dialect Abstraction'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 179
        Width = 929
        Height = 315
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 935
        Height = 176
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object MemComandos: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 744
          Height = 170
          Align = alClient
          Lines.Strings = (
            'select {ucase(nome)} as nome1, pessoas.* from pessoas')
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 750
          Top = 0
          Width = 185
          Height = 176
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object BtnFirebird: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 179
            Height = 46
            Align = alTop
            Caption = 'Firebird'
            OnClick = BtnFirebirdClick
          end
          object BtnPostgreSQL: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 55
            Width = 179
            Height = 46
            Align = alTop
            Caption = 'PostgreSQL'
            OnClick = BtnPostgreSQLClick
          end
        end
      end
      object MemSQL: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 500
        Width = 929
        Height = 89
        Align = alBottom
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited GbxPostgreSQL: TGroupBox
        Visible = True
      end
    end
  end
  inherited OpenDialog1: TOpenDialog
    Left = 595
    Top = 315
  end
  object FDQuery1: TFDQuery
    AfterOpen = FDQuery1AfterOpen
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtWideMemo
        TargetDataType = dtWideString
      end>
    Left = 470
    Top = 320
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 470
    Top = 365
  end
end
