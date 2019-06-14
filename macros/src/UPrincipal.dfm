inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Macros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 935
        Height = 497
        ActivePage = TabSheet3
        Align = alClient
        TabOrder = 0
        TabStop = False
        TabWidth = 150
        object TabSheet3: TTabSheet
          Caption = 'Sele'#231#227'o'
          object GroupBox1: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 185
            Height = 463
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
              Top = 433
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
              Height = 224
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
            Width = 730
            Height = 463
            Align = alClient
            Caption = 'Dados'
            TabOrder = 1
            object DBGrid1: TDBGrid
              AlignWithMargins = True
              Left = 5
              Top = 18
              Width = 720
              Height = 440
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
        object TabSheet4: TTabSheet
          Caption = 'Execu'#231#227'o'
          ImageIndex = 1
          object Splitter2: TSplitter
            Left = 0
            Top = 111
            Width = 927
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object DBGrid2: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 117
            Width = 921
            Height = 349
            Align = alClient
            DataSource = DataSource1
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object GroupBox3: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 921
            Height = 105
            Align = alTop
            Caption = 'SQL'
            TabOrder = 0
            object MemSQL: TMemo
              AlignWithMargins = True
              Left = 5
              Top = 18
              Width = 827
              Height = 82
              Align = alClient
              Lines.Strings = (
                'select * from arraydml where id <= {YEAR({NOW()})}')
              TabOrder = 0
            end
            object Panel1: TPanel
              Left = 835
              Top = 15
              Width = 84
              Height = 88
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object BtnSQLExecutar: TButton
                Left = 3
                Top = 1
                Width = 75
                Height = 25
                Caption = 'Executar'
                TabOrder = 0
                OnClick = BtnSQLExecutarClick
              end
            end
          end
        end
      end
      object MemComandoExecutado: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 500
        Width = 929
        Height = 89
        Align = alBottom
        TabOrder = 1
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 540
    Top = 325
  end
  object FDQuery1: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    SQL.Strings = (
      '')
    Left = 470
    Top = 320
  end
end
