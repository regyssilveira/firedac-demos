object DtmImportaArquivo: TDtmImportaArquivo
  OldCreateOrder = False
  Height = 276
  Width = 560
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveTextReader1
    Writer = FDBatchMoveDataSetWriter1
    Options = [poClearDest, poClearDestNoUndo, poIdentityInsert, poCreateDest, poSkipUnmatchedDestFields, poUseTransactions]
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 150
    Top = 185
  end
  object FDBatchMoveTextReader1: TFDBatchMoveTextReader
    FileName = 'C:\Users\regys\Desktop\exportacao2.txt'
    DataDef.Fields = <
      item
        FieldName = 'ID'
        DataType = atLongInt
        FieldSize = 2
      end
      item
        FieldName = 'CP_STRING'
        DataType = atString
        FieldSize = 19
      end
      item
        FieldName = 'CP_NUM_VALOR'
        DataType = atFloat
        FieldSize = 19
      end
      item
        FieldName = 'CP_NUM_INTEIRO'
        DataType = atLongInt
        FieldSize = 4
      end
      item
        FieldName = 'CP_DATA'
        DataType = atDate
        FieldSize = 10
      end
      item
        FieldName = 'CP_HORA'
        DataType = atTime
        FieldSize = 8
      end
      item
        FieldName = 'CP_DATA_HORA'
        DataType = atDateTime
        FieldSize = 19
      end>
    DataDef.Delimiter = '"'
    DataDef.Separator = ';'
    DataDef.RecordFormat = rfCustom
    DataDef.WithFieldNames = True
    Left = 80
    Top = 110
  end
  object FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter
    DataSet = QryInsertBatchmove
    Left = 245
    Top = 110
  end
  object QryBatchMove: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from batchmove')
    Left = 415
    Top = 45
  end
  object OpenDialog1: TOpenDialog
    Left = 70
    Top = 25
  end
  object QryInsertBatchmove: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    FetchOptions.AssignedValues = [evMode, evItems]
    FetchOptions.Mode = fmManual
    FetchOptions.Items = [fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'select * from batchmove')
    Left = 245
    Top = 45
  end
end
