inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Demo Transactions'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 929
        Height = 158
        Align = alTop
        Caption = 'Op'#231#245'es'
        TabOrder = 0
        object BtnTransactionStart: TButton
          Left = 15
          Top = 90
          Width = 141
          Height = 25
          Caption = 'star transaction'
          TabOrder = 2
          OnClick = BtnTransactionStartClick
        end
        object BtnTransactionCommit: TButton
          Left = 15
          Top = 121
          Width = 141
          Height = 25
          Caption = 'commit'
          TabOrder = 3
          OnClick = BtnTransactionCommitClick
        end
        object BtnTransacationRollback: TButton
          Left = 162
          Top = 121
          Width = 141
          Height = 25
          Caption = 'rollback'
          TabOrder = 4
          OnClick = BtnTransacationRollbackClick
        end
        object BtnNovoRegistro: TButton
          Left = 345
          Top = 121
          Width = 141
          Height = 25
          Caption = 'Inserir novo'
          TabOrder = 5
          OnClick = BtnNovoRegistroClick
        end
        object CkbNestedTransactions: TCheckBox
          Left = 15
          Top = 27
          Width = 161
          Height = 17
          Caption = 'Utilizar NestedTransactions'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object BtnReabrirTabela: TButton
          Left = 525
          Top = 121
          Width = 141
          Height = 25
          Caption = 'Reabrir tabela'
          TabOrder = 6
          OnClick = BtnReabrirTabelaClick
        end
        object CkbAutoCommit: TCheckBox
          Left = 15
          Top = 50
          Width = 161
          Height = 17
          Caption = 'Utilizar AutoCommit'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 167
        Width = 929
        Height = 422
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
  object FDQuery1: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    SQL.Strings = (
      'select * from transactions')
    Left = 470
    Top = 320
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 470
    Top = 370
  end
end
