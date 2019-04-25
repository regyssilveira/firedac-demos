object DtmConnection: TDtmConnection
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 305
  Width = 339
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\regys\Desktop\Teste MD\bin\database\MESTREDETA' +
        'LHE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 92
    Top = 60
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 207
    Top = 60
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 207
    Top = 105
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 207
    Top = 151
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 207
    Top = 195
  end
end
