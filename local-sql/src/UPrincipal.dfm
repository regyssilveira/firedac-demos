object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Demo LocalSQL'
  ClientHeight = 641
  ClientWidth = 1064
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnFirebird: TFDConnection
    Params.Strings = (
      'Database=D:\projetos\firedac-demos\demo-database\firebirddb.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 205
    Top = 70
  end
  object FDConnPG: TFDConnection
    Params.Strings = (
      'Database=CursoFiredac'
      'User_Name=postgres'
      'Password=123456'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 330
    Top = 70
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\PostgreSQL\psqlodbc32bits'
    Left = 750
    Top = 170
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 750
    Top = 220
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 760
    Top = 65
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 770
    Top = 75
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 780
    Top = 85
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = FDConnLocal
    Active = True
    DataSets = <>
    Left = 260
    Top = 215
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 750
    Top = 270
  end
  object FDConnLocal: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 260
    Top = 265
  end
  object QryFirebird: TFDQuery
    Active = True
    LocalSQL = FDLocalSQL1
    Connection = FDConnFirebird
    SQL.Strings = (
      'select * from localsql')
    Left = 205
    Top = 120
  end
  object QryPG: TFDQuery
    Active = True
    LocalSQL = FDLocalSQL1
    Connection = FDConnPG
    SQL.Strings = (
      'select * from localsql')
    Left = 330
    Top = 120
  end
  object QryLocal: TFDQuery
    Connection = FDConnLocal
    SQL.Strings = (
      'select * from QryFirebird'
      'union all'
      'select * from QryPG')
    Left = 260
    Top = 315
  end
end
