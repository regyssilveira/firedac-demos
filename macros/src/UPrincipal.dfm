inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Macros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 185
        Height = 586
        Align = alLeft
        Caption = 'Objetos'
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 2
          Top = 195
          Width = 181
          Height = 5
          Cursor = crVSplit
          Align = alTop
        end
        object LstTabelas: TListBox
          AlignWithMargins = True
          Left = 5
          Top = 49
          Width = 175
          Height = 143
          Align = alTop
          ItemHeight = 13
          TabOrder = 1
          OnClick = LstTabelasClick
        end
        object BtnSelecionar: TButton
          AlignWithMargins = True
          Left = 5
          Top = 556
          Width = 175
          Height = 25
          Align = alBottom
          Caption = 'Selecionar'
          TabOrder = 3
          OnClick = BtnSelecionarClick
        end
        object LstCampos: TListBox
          AlignWithMargins = True
          Left = 5
          Top = 203
          Width = 175
          Height = 347
          Align = alClient
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 2
        end
        object BtnMostrarObjetos: TButton
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 175
          Height = 25
          Align = alTop
          Caption = 'Mostrar objetos'
          TabOrder = 0
          OnClick = BtnMostrarObjetosClick
        end
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 194
        Top = 3
        Width = 738
        Height = 586
        Align = alClient
        Caption = 'Dados'
        TabOrder = 1
        object DBGrid1: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 728
          Height = 563
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 540
    Top = 325
  end
  object FDQuery1: TFDQuery
    Connection = DtmConnection.FDConnection1
    SQL.Strings = (
      '')
    Left = 470
    Top = 320
  end
end
