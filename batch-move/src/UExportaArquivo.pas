unit UExportaArquivo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, Vcl.Dialogs;

type
  TDtmExportaArquivo = class(TDataModule)
    FDBatchMoveTextWriter1: TFDBatchMoveTextWriter;
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    QryExportaArquivo: TFDQuery;
    SaveDialog1: TSaveDialog;
  private

  public
    procedure SelecionarDados(const AString: string);
    procedure SalvarArquivoTexto;
  end;

var
  DtmExportaArquivo: TDtmExportaArquivo;

implementation

uses
  UConnection;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmExportaArquivo }

procedure TDtmExportaArquivo.SalvarArquivoTexto;
begin
  if QryExportaArquivo.IsEmpty then
    raise EDatabaseError.Create('Nenhum dado foi selecionado, impossível continuar!');

  if SaveDialog1.Execute then
  begin
    FDBatchMoveTextWriter1.Encoding               := TFDEncoding.ecANSI;
    FDBatchMoveTextWriter1.DataDef.WithFieldNames := True;
    FDBatchMoveTextWriter1.DataDef.Delimiter      := '"';
    FDBatchMoveTextWriter1.DataDef.Separator      := ';';
    FDBatchMoveTextWriter1.FileName               := SaveDialog1.FileName;

    FDBatchMove1.Execute;

    ShowMessage('Arquivo exportado com sucesso');
  end;
end;

procedure TDtmExportaArquivo.SelecionarDados(const AString: string);
begin
  if AString.Trim.IsEmpty then
    raise EDatabaseError.Create('Não foi informado o SQL de seleção de dados!');

  QryExportaArquivo.Close;
  QryExportaArquivo.Open(AString);
end;

end.
