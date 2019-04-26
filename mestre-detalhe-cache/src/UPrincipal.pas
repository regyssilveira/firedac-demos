unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFrmPrincipal = class(TFrmBasePrincipal)
    Splitter1: TSplitter;
    Panel1: TPanel;
    BtnAplicarAlteracoes: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DtsMestre: TDataSource;
    DtsDetalhe: TDataSource;
    QryMestre: TFDQuery;
    QryMestreID_MESTRE: TIntegerField;
    QryMestreDESCRICAO: TStringField;
    QryDetalhe: TFDQuery;
    QryDetalheID_MESTRE: TIntegerField;
    QryDetalheID_ITEM: TIntegerField;
    QryDetalheDESCRICAO: TStringField;
    QryDetalheVALOR: TFMTBCDField;
    FDSchemaAdapter1: TFDSchemaAdapter;
    BtnAbrirTabelas: TButton;
    procedure BtnAplicarAlteracoesClick(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure BtnAbrirTabelasClick(Sender: TObject);
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

procedure TFrmPrincipal.BtnAbrirTabelasClick(Sender: TObject);
begin
  QryMestre.Open;
  QryDetalhe.Open;
end;

procedure TFrmPrincipal.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
  // limpeza do cache após o apply updates
  QryMestre.CommitUpdates;
  QryDetalhe.CommitUpdates;
end;

procedure TFrmPrincipal.BtnAplicarAlteracoesClick(Sender: TObject);
begin
  // persistir alterações que estão no cache para o banco
  if FDSchemaAdapter1.ChangeCount > 0 then
  begin
    FDSchemaAdapter1.ApplyUpdates;
    ShowMessage('Alterações aplicadas com sucesso!');
  end
  else
    ShowMessage('Não existe nenhuma alteração para aplicar!');
end;

end.
