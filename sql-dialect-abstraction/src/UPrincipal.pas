unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmBasePrincipal1 = class(TFrmBasePrincipal)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    MemComandos: TMemo;
    Panel2: TPanel;
    BtnFirebird: TSpeedButton;
    BtnPostgreSQL: TSpeedButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    MemSQL: TMemo;
    procedure BtnFirebirdClick(Sender: TObject);
    procedure BtnPostgreSQLClick(Sender: TObject);
    procedure FDQuery1AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBasePrincipal1: TFrmBasePrincipal1;

implementation

uses
  UFBConnection, UPGConnection;

{$R *.dfm}

procedure TFrmBasePrincipal1.BtnFirebirdClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Connection := DtmFBConnection.FDConnection1;

  FDQuery1.Open(MemComandos.Text);
end;

procedure TFrmBasePrincipal1.BtnPostgreSQLClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Connection := DtmPGConnection.FDConnection1;

  FDQuery1.Open(MemComandos.Text);
end;

procedure TFrmBasePrincipal1.FDQuery1AfterOpen(DataSet: TDataSet);
begin
  MemSQL.Text := FDQuery1.Command.SQLText;
end;

end.
