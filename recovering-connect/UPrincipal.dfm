object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 579
  ClientWidth = 959
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 943
    Height = 278
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 292
    Width = 943
    Height = 278
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\CursoFiredac\CURSOFIREDAC.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 460
    Top = 130
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'Database=C:\CursoFiredac\CURSOFIREDAC.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    OnRecover = FDConnection2Recover
    Left = 460
    Top = 380
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pessoas')
    Left = 295
    Top = 115
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection2
    SQL.Strings = (
      'select * from pessoas')
    Left = 300
    Top = 360
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 295
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 300
    Top = 405
  end
end
