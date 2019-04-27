object DtmPGConnection: TDtmPGConnection
  OldCreateOrder = False
  Height = 335
  Width = 343
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=CursoFiredac'
      'User_Name=postgres'
      'Password=123456'
      'Server=localhost'
      'DriverID=PG')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
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
    Top = 110
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 207
    Top = 210
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 205
    Top = 160
  end
end
