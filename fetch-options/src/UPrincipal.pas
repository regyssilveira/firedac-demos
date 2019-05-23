unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Samples.Spin, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPrincipal = class(TFrmBasePrincipal)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    EdtQuantRegistros: TSpinEdit;
    Label11: TLabel;
    BtnPagTodos: TButton;
    BtnPagAnterior: TButton;
    BtnPagProximo: TButton;
    QryTeste: TFDQuery;
    DataSource1: TDataSource;
    BtnFetchNext: TButton;
    BtnFetchAll: TButton;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnPagAnteriorClick(Sender: TObject);
    procedure BtnPagProximoClick(Sender: TObject);
    procedure BtnPagTodosClick(Sender: TObject);
    procedure BtnFetchAllClick(Sender: TObject);
    procedure BtnFetchNextClick(Sender: TObject);
  private
    FRegAtual: Integer;
  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFBConnection;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  FRegAtual := 0;
end;

procedure TFrmPrincipal.BtnFetchAllClick(Sender: TObject);
begin
  if QryTeste.Active then
    QryTeste.FetchAll;
end;

procedure TFrmPrincipal.BtnFetchNextClick(Sender: TObject);
begin
  if QryTeste.Active then
    QryTeste.FetchNext;
end;

procedure TFrmPrincipal.BtnPagAnteriorClick(Sender: TObject);
begin
  FRegAtual := FRegAtual - EdtQuantRegistros.Value;
  if FRegAtual <= 0 then
    FRegAtual := 0;

  QryTeste.Close;
  QryTeste.FetchOptions.RecsSkip := FRegAtual;
  QryTeste.FetchOptions.RecsMax  := EdtQuantRegistros.Value;
  QryTeste.Open;
end;

procedure TFrmPrincipal.BtnPagProximoClick(Sender: TObject);
begin
  QryTeste.Close;
  QryTeste.FetchOptions.RecsSkip := FRegAtual;
  QryTeste.FetchOptions.RecsMax  := EdtQuantRegistros.Value;
  QryTeste.Open;

  FRegAtual := FRegAtual + EdtQuantRegistros.Value;
end;

procedure TFrmPrincipal.BtnPagTodosClick(Sender: TObject);
begin
  QryTeste.Close;
  QryTeste.FetchOptions.RecsSkip := -1;
  QryTeste.FetchOptions.RecsMax  := -1;
  QryTeste.Open;
end;

end.
