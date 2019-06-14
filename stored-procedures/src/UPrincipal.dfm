inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Stored Procedure'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 929
        Height = 93
        Align = alTop
        Caption = 'Op'#231#245'es'
        TabOrder = 0
        object GroupBox3: TGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 441
          Height = 70
          Align = alLeft
          Caption = 'Inserir novo'
          TabOrder = 0
          object BtnUFNova: TSpeedButton
            Left = 370
            Top = 39
            Width = 56
            Height = 22
            Caption = 'Inserir'
            OnClick = BtnUFNovaClick
          end
          object Label11: TLabel
            Left = 13
            Top = 24
            Width = 22
            Height = 13
            Caption = 'Sigla'
          end
          object Label12: TLabel
            Left = 83
            Top = 24
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
          end
          object EdtUFNovaDescr: TEdit
            Left = 83
            Top = 40
            Width = 281
            Height = 21
            TabOrder = 1
          end
          object EdtUFNovaSigla: TEdit
            Left = 13
            Top = 40
            Width = 64
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          AlignWithMargins = True
          Left = 452
          Top = 18
          Width = 359
          Height = 70
          Align = alLeft
          Caption = 'Buscar'
          TabOrder = 1
          object BtnUFBuscar: TSpeedButton
            Left = 302
            Top = 39
            Width = 49
            Height = 22
            Caption = 'Buscar'
            OnClick = BtnUFBuscarClick
          end
          object Label13: TLabel
            Left = 15
            Top = 24
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
          end
          object EdtUFBuscar: TEdit
            Left = 15
            Top = 40
            Width = 281
            Height = 21
            TabOrder = 0
          end
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 102
        Width = 929
        Height = 487
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
  object FDStoredProc1: TFDStoredProc
    Connection = DtmFBConnection.FDConnection1
    Left = 470
    Top = 320
  end
  object DataSource1: TDataSource
    DataSet = FDStoredProc1
    Left = 470
    Top = 365
  end
end
