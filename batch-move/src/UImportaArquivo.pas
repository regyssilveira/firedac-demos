unit UImportaArquivo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TDtmImportaArquivo = class(TDataModule)
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveTextReader1: TFDBatchMoveTextReader;
    FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter;
    QryBatchMove: TFDQuery;
    OpenDialog1: TOpenDialog;
    QryInsertBatchmove: TFDQuery;
  private

  public
    procedure ImportarArquivo;
  end;

var
  DtmImportaArquivo: TDtmImportaArquivo;

implementation

uses
  UFBConnection;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmImportaArquivo }

procedure TDtmImportaArquivo.ImportarArquivo;
begin
  if OpenDialog1.Execute then
  begin
    FDBatchMoveTextReader1.Encoding               := TFDEncoding.ecANSI;
    FDBatchMoveTextReader1.DataDef.WithFieldNames := True;
    FDBatchMoveTextReader1.DataDef.Delimiter      := '"';
    FDBatchMoveTextReader1.DataDef.Separator      := ';';
    FDBatchMoveTextReader1.FileName               := OpenDialog1.FileName;

    FDBatchMove1.Execute;

    ShowMessage('Importação finalizada!');

    QryBatchMove.Close;
    QryBatchMove.Open;
  end;
end;

end.
