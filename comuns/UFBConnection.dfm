object DtmFBConnection: TDtmFBConnection
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 518
  Width = 636
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\firedac-demos\demo-database\firebirddb.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'MonitorBy=Remote'
      'DriverID=FB')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    ConnectedStoredUsage = []
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 77
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
    Top = 110
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 207
    Top = 161
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 207
    Top = 210
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 75
    Top = 145
  end
end
