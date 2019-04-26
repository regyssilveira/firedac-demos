unit UMoverDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Comp.BatchMove,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.BatchMove.SQL,
  FireDAC.Comp.BatchMove.DataSet, Vcl.Dialogs;

type
  TDtmMoverDados = class(TDataModule)
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveSQLReader1: TFDBatchMoveSQLReader;
    FDBatchMoveSQLWriter1: TFDBatchMoveSQLWriter;
  private

  public
    procedure MoverDados;
  end;

var
  DtmMoverDados: TDtmMoverDados;

implementation

uses
  UFBConnection, UPGConnection;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmMoverDados }

procedure TDtmMoverDados.MoverDados;
begin
  FDBatchMoveSQLReader1.Connection := DtmFBConnection.FDConnection1;
  FDBatchMoveSQLReader1.TableName  := 'BATCHMOVE';

  FDBatchMoveSQLWriter1.Connection := DtmPGConnection.FDConnection1;
  FDBatchMoveSQLWriter1.TableName  := 'BATCHMOVE';

  FDBatchMove1.Execute;

  ShowMessage('Dados movidos corretamente!');
end;

end.
