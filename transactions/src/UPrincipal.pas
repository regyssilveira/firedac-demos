unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPrincipal = class(TFrmBasePrincipal)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BtnTransactionStart: TButton;
    BtnTransactionCommit: TButton;
    BtnTransacationRollback: TButton;
    BtnNovoRegistro: TButton;
    CkbNestedTransactions: TCheckBox;
    BtnReabrirTabela: TButton;
    CkbAutoCommit: TCheckBox;
    procedure BtnNovoRegistroClick(Sender: TObject);
    procedure BtnTransactionStartClick(Sender: TObject);
    procedure BtnTransactionCommitClick(Sender: TObject);
    procedure BtnTransacationRollbackClick(Sender: TObject);
    procedure BtnReabrirTabelaClick(Sender: TObject);
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

procedure TFrmPrincipal.BtnNovoRegistroClick(Sender: TObject);
var
  Id: string;
  Descricao: string;
begin
  Descricao := InputBox('Novo', 'Digite e descrição', EmptyStr);
  if Descricao.Trim.IsEmpty then
    raise Exception.Create('Descrição não pode ser vazia!');

  Id := VarToStr(DtmFBConnection.FDConnection1.ExecSQLScalar(
    'insert into transactions (descricao) values (?) returning Id',
    [Descricao],
    [ftString]
  ));

  ShowMessage('Registro inserido, id: ' + Id);
end;

procedure TFrmPrincipal.BtnReabrirTabelaClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Open;

  ShowMessage('Tabela foi fechada e aberta novamente!');
end;

procedure TFrmPrincipal.BtnTransactionStartClick(Sender: TObject);
begin
  DtmFBConnection.FDConnection1.TxOptions.EnableNested := CkbNestedTransactions.Checked;
  DtmFBConnection.FDConnection1.TxOptions.AutoCommit   := CkbAutoCommit.Checked;

  DtmFBConnection.FDConnection1.StartTransaction;
  ShowMessage('Transação iniciada!');
end;

procedure TFrmPrincipal.BtnTransactionCommitClick(Sender: TObject);
begin
  if not DtmFBConnection.FDConnection1.InTransaction then
    raise Exception.Create('Nenhuma transação iniciada!');

  // persiste e limpa os cursores da memoria
  DtmFBConnection.FDConnection1.Commit;

  // persiste e não limpa os cursores da memoria, no final você precisa
  // chamar um commit para limpar
  //DtmFBConnection.FDConnection1.CommitRetaining;

  ShowMessage('Commit!');
end;

procedure TFrmPrincipal.BtnTransacationRollbackClick(Sender: TObject);
begin
  if not DtmFBConnection.FDConnection1.InTransaction then
    raise Exception.Create('Nenhuma transação iniciada!');

  // desfaz e limpa os cursores da memoria
  DtmFBConnection.FDConnection1.Rollback;

  // desfaz mas não limpa os cursores da memoria
  //DtmFBConnection.FDConnection1.RollbackRetaining;

  ShowMessage('Rollback!');
end;

end.
