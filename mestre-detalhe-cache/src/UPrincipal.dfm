object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Demo Mestre Detalhe'
  ClientHeight = 457
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 126
    Width = 891
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 420
    Width = 885
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnAplicarAlteracoes: TButton
      AlignWithMargins = True
      Left = 739
      Top = 3
      Width = 143
      Height = 28
      Align = alRight
      Caption = 'Aplicar Altera'#231#245'es'
      TabOrder = 0
      OnClick = BtnAplicarAlteracoesClick
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 885
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
    Top = 132
    Width = 885
    Height = 282
    Align = alClient
    DataSource = DtsDetalhe
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\regys\Desktop\Teste MD\bin\database\MESTREDETA' +
        'LHE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 125
    Top = 230
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
    Connection = FDConnection1
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
    Connection = FDConnection1
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
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 745
    Top = 215
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 745
    Top = 165
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 745
    Top = 260
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 745
    Top = 305
  end
end
