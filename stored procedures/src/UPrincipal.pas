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
  TFrmPrincipal = class(TFrmBasePrincipal)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    BtnUFNova: TSpeedButton;
    DBGrid1: TDBGrid;
    FDStoredProc1: TFDStoredProc;
    DataSource1: TDataSource;
    EdtUFNovaDescr: TEdit;
    EdtUFNovaSigla: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    BtnUFBuscar: TSpeedButton;
    Label13: TLabel;
    EdtUFBuscar: TEdit;
    procedure BtnUFNovaClick(Sender: TObject);
    procedure BtnUFBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFBConnection;

{$R *.dfm}

procedure TFrmPrincipal.BtnUFNovaClick(Sender: TObject);
begin
  if Trim(EdtUFNovaSigla.Text).Trim.IsEmpty then
    raise Exception.Create('Informe a sigla da uf para continuar.');

  if Trim(EdtUFNovaDescr.Text).Trim.IsEmpty then
    raise Exception.Create('Informe a descrição da uf para continuar.');

  FDStoredProc1.StoredProcName := 'PR_UF_INSERIR';
  FDStoredProc1.Prepare;

  FDStoredProc1.ParamByName('P_UF').AsString        := EdtUFNovaSigla.Text;
  FDStoredProc1.ParamByName('P_DESCRICAO').AsString := EdtUFNovaDescr.Text;
  FDStoredProc1.Execute;

  ShowMessage('Inserido com sucesso!');
end;

procedure TFrmPrincipal.BtnUFBuscarClick(Sender: TObject);
begin
  if Trim(EdtUFBuscar.Text).Trim.IsEmpty then
    raise Exception.Create('Informe a descricao parcial da uf para continuar.');

  FDStoredProc1.Close;
  FDStoredProc1.StoredProcName := 'PR_UF_BUSCA';
  FDStoredProc1.Prepare;

  FDStoredProc1.ParamByName('P_DESCRICAO').AsString := EdtUFBuscar.Text;
  FDStoredProc1.Open;

  ShowMessage('Dados retornados com sucesso!');
end;

end.
