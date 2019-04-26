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
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 1058
    Height = 594
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1064
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 3
      Top = 9
      Width = 191
      Height = 25
      Caption = 'Abrir Local SQL'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object FDConnFirebird: TFDConnection
    Params.Strings = (
      'Database=D:\projetos\firedac-demos\demo-database\firebirddb.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 295
    Top = 200
  end
  object FDConnPG: TFDConnection
    Params.Strings = (
      'Database=CursoFiredac'
      'User_Name=postgres'
      'Password=sautcom'
      'DriverID=PG')
    LoginPrompt = False
    Left = 420
    Top = 200
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\PostgreSQL\psqlodbc32bits'
    Left = 745
    Top = 315
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 745
    Top = 365
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 745
    Top = 260
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 745
    Top = 215
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 745
    Top = 170
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = FDConnLocal
    Active = True
    DataSets = <>
    Left = 350
    Top = 345
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 745
    Top = 415
  end
  object FDConnLocal: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 350
    Top = 395
  end
  object QryFirebird: TFDQuery
    LocalSQL = FDLocalSQL1
    Connection = FDConnFirebird
    SQL.Strings = (
      'select * from localsql')
    Left = 295
    Top = 250
  end
  object QryPG: TFDQuery
    LocalSQL = FDLocalSQL1
    Connection = FDConnPG
    SQL.Strings = (
      'select * from localsql')
    Left = 420
    Top = 250
  end
  object QryLocal: TFDQuery
    Connection = FDConnLocal
    SQL.Strings = (
      'select * from QryFirebird'
      ''
      'union all'
      ''
      'select * from QryPG')
    Left = 350
    Top = 445
  end
  object DataSource1: TDataSource
    DataSet = QryLocal
    Left = 350
    Top = 495
  end
end
