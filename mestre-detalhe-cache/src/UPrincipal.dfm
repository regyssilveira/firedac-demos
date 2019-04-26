inherited FrmPrincipal: TFrmPrincipal
  Caption = 'Mestre Detalhe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 935
      ExplicitHeight = 592
      object Splitter1: TSplitter
        Left = 0
        Top = 126
        Width = 935
        Height = 5
        Cursor = crVSplit
        Align = alTop
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 555
        Width = 929
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object BtnAplicarAlteracoes: TButton
          AlignWithMargins = True
          Left = 776
          Top = 3
          Width = 150
          Height = 28
          Align = alRight
          Caption = 'Aplicar Altera'#231#245'es'
          TabOrder = 1
          OnClick = BtnAplicarAlteracoesClick
        end
        object BtnAbrirTabelas: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 150
          Height = 28
          Align = alLeft
          Caption = 'Abrir tabelas'
          TabOrder = 0
          OnClick = BtnAbrirTabelasClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 929
        Height = 120
        Align = alTop
        DataSource = DtsMestre
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 134
        Width = 929
        Height = 415
        Align = alClient
        DataSource = DtsDetalhe
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 935
      ExplicitHeight = 592
    end
  end
  object DtsMestre: TDataSource
    DataSet = QryMestre
    Left = 315
    Top = 230
  end
  object DtsDetalhe: TDataSource
    DataSet = QryDetalhe
    Left = 315
    Top = 310
  end
  object QryMestre: TFDQuery
    CachedUpdates = True
    Connection = DtmFBConnection.FDConnection1
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade]
    SQL.Strings = (
      'select * from mestre')
    Left = 245
    Top = 230
    object QryMestreID_MESTRE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_MESTRE'
      Origin = 'ID_MESTRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryMestreDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object QryDetalhe: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'ID_MESTRE'
    MasterSource = DtsMestre
    MasterFields = 'ID_MESTRE'
    DetailFields = 'ID_MESTRE'
    Connection = DtmFBConnection.FDConnection1
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from detalhe where id_mestre = :id_mestre')
    Left = 245
    Top = 310
    ParamData = <
      item
        Name = 'ID_MESTRE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryDetalheID_MESTRE: TIntegerField
      FieldName = 'ID_MESTRE'
      Origin = 'ID_MESTRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryDetalheID_ITEM: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryDetalheDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object QryDetalheVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    AfterApplyUpdate = FDSchemaAdapter1AfterApplyUpdate
    Left = 395
    Top = 270
  end
end
