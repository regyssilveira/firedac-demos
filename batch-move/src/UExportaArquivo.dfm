object DtmExportaArquivo: TDtmExportaArquivo
  OldCreateOrder = False
  Height = 275
  Width = 530
  object FDBatchMoveTextWriter1: TFDBatchMoveTextWriter
    DataDef.Fields = <>
    Encoding = ecANSI
    Left = 249
    Top = 84
  end
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveTextWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 160
    Top = 160
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    DataSet = QryExportaArquivo
    Left = 79
    Top = 84
  end
  object QryExportaArquivo: TFDQuery
    Connection = DtmFBConnection.FDConnection1
    Left = 80
    Top = 35
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'exportacao'
    Filter = 'arquivos de texto|*.txt'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Salvar arquivo'
    Left = 384
    Top = 210
  end
  object FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter
    DataDef.Fields = <>
    Left = 405
    Top = 85
  end
end
