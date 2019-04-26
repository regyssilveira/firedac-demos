object DtmMoverDados: TDtmMoverDados
  OldCreateOrder = False
  Height = 236
  Width = 426
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveSQLReader1
    Writer = FDBatchMoveSQLWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 195
    Top = 150
  end
  object FDBatchMoveSQLReader1: TFDBatchMoveSQLReader
    Connection = DtmFBConnection.FDConnection1
    TableName = 'BATCHMOVE'
    Left = 100
    Top = 55
  end
  object FDBatchMoveSQLWriter1: TFDBatchMoveSQLWriter
    Connection = DtmPGConnection.FDConnection1
    TableName = 'BATCHMOVE'
    Left = 300
    Top = 55
  end
end
