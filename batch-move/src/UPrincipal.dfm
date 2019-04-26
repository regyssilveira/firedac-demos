inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Batchmove'
  ClientHeight = 531
  ClientWidth = 854
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 848
    Height = 525
    inherited TabSheet1: TTabSheet
      object PageControl2: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 834
        Height = 491
        ActivePage = TabSheet3
        Align = alClient
        TabOrder = 0
        TabStop = False
        TabWidth = 150
        object TabSheet3: TTabSheet
          Caption = 'Exportar para arquivo'
          object Splitter1: TSplitter
            Left = 0
            Top = 81
            Width = 826
            Height = 5
            Cursor = crVSplit
            Align = alTop
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 826
            Height = 81
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object MemSQLSelecionar: TMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 707
              Height = 75
              Align = alClient
              Lines.Strings = (
                'select * from batchmove')
              TabOrder = 0
            end
            object Panel2: TPanel
              Left = 713
              Top = 0
              Width = 113
              Height = 81
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object BtnExpArqExecutaSQL: TSpeedButton
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 107
                Height = 25
                Align = alTop
                Caption = 'Executar'
                OnClick = BtnExpArqExecutaSQLClick
              end
              object BtnExpArqSalvar: TSpeedButton
                AlignWithMargins = True
                Left = 3
                Top = 34
                Width = 107
                Height = 25
                Align = alTop
                Caption = 'Salvar'
                OnClick = BtnExpArqSalvarClick
              end
            end
          end
          object DBGrid1: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 89
            Width = 820
            Height = 371
            Align = alClient
            DataSource = DtsExporta
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Importar de arquivo'
          ImageIndex = 1
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 826
            Height = 38
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object BtnImpArquivo: TSpeedButton
              AlignWithMargins = True
              Left = 142
              Top = 3
              Width = 133
              Height = 32
              Align = alLeft
              Caption = 'Importar arquivo'
              OnClick = BtnImpArquivoClick
            end
            object BtnImpArquivoAbrir: TSpeedButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 133
              Height = 32
              Align = alLeft
              Caption = 'Abrir tabela'
              OnClick = BtnImpArquivoAbrirClick
            end
          end
          object DBGrid2: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 41
            Width = 820
            Height = 419
            Align = alClient
            DataSource = DtsBatchMove
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Mover dados'
          ImageIndex = 2
          object BtnMoverDados: TSpeedButton
            Left = 20
            Top = 15
            Width = 133
            Height = 37
            Caption = 'Mover dados'
            OnClick = BtnMoverDadosClick
          end
        end
      end
    end
    inherited TabSheet2: TTabSheet
      Caption = 'Configura'#231#245'es FB'
      inherited GbxPostgreSQL: TGroupBox
        Width = 834
        Visible = True
      end
      inherited GbxFirebird: TGroupBox
        Width = 834
      end
      inherited PnlBotton: TPanel
        Top = 456
        Width = 840
        inherited BtnSalvarConfiguracoes: TSpeedButton
          Left = 733
        end
      end
    end
  end
  object DtsExporta: TDataSource
    DataSet = DtmExportaArquivo.QryExportaArquivo
    Left = 600
    Top = 235
  end
  object DtsBatchMove: TDataSource
    DataSet = DtmImportaArquivo.QryBatchMove
    Left = 600
    Top = 290
  end
end
