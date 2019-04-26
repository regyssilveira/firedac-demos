object DtmMoverDados: TDtmMoverDados
  OldCreateOrder = False
  Height = 347
  Width = 513
  object FDBatchMove1: TFDBatchMove
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 70
    Top = 55
  end
  object FDConnPostgreSQL: TFDConnection
    Params.Strings = (
      'DriverID=PG')
    Left = 345
    Top = 55
  end
end
