inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Fetch Options'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 935
        Height = 66
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label11: TLabel
          Left = 20
          Top = 15
          Width = 119
          Height = 13
          Caption = 'Quantidade de Registros'
        end
        object Label12: TLabel
          Left = 497
          Top = 13
          Width = 338
          Height = 13
          Caption = 
            'Configure o Query para Manual antes de utilizar (FetchOptions, M' +
            'ode)'
        end
        object EdtQuantRegistros: TSpinEdit
          Left = 20
          Top = 31
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 10
        end
        object BtnPagTodos: TButton
          Left = 147
          Top = 29
          Width = 75
          Height = 26
          Caption = 'Todos'
          TabOrder = 1
          OnClick = BtnPagTodosClick
        end
        object BtnPagAnterior: TButton
          Left = 228
          Top = 29
          Width = 75
          Height = 26
          Caption = 'Anterior'
          TabOrder = 2
          OnClick = BtnPagAnteriorClick
        end
        object BtnPagProximo: TButton
          Left = 309
          Top = 29
          Width = 75
          Height = 26
          Caption = 'Pr'#243'ximo'
          TabOrder = 3
          OnClick = BtnPagProximoClick
        end
        object BtnFetchNext: TButton
          Left = 497
          Top = 29
          Width = 75
          Height = 26
          Caption = 'Fetch Next'
          TabOrder = 4
          OnClick = BtnFetchNextClick
        end
        object BtnFetchAll: TButton
          Left = 578
          Top = 29
          Width = 75
          Height = 26
          Caption = 'FetchAll'
          TabOrder = 5
          OnClick = BtnFetchAllClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 69
        Width = 929
        Height = 520
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object QryTeste: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    FetchOptions.AssignedValues = [evMode, evItems]
    SQL.Strings = (
      'select * from arraydml')
    Left = 160
    Top = 180
  end
  object DataSource1: TDataSource
    DataSet = QryTeste
    Left = 160
    Top = 230
  end
end
