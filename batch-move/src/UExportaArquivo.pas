unit UExportaArquivo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, Vcl.Dialogs,
  FireDAC.Comp.BatchMove.JSON;

type
  TDtmExportaArquivo = class(TDataModule)
    FDBatchMoveTextWriter1: TFDBatchMoveTextWriter;
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    QryExportaArquivo: TFDQuery;
    SaveDialog1: TSaveDialog;
    FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter;
  private

  public
    procedure SelecionarDados(const AString: string);
    procedure SalvarArquivoTexto;
    procedure SalvarArquivoJSON;
  end;

var
  DtmExportaArquivo: TDtmExportaArquivo;

implementation

uses
  UFBConnection;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDtmExportaArquivo }

procedure TDtmExportaArquivo.SalvarArquivoJSON;
begin
  if QryExportaArquivo.IsEmpty then
    raise EDatabaseError.Create('Nenhum dado foi selecionado, impossível continuar!');

  SaveDialog1.DefaultExt := '*.json';
  SaveDialog1.Filter     := 'arquivos de dados json|*.json';
  SaveDialog1.FileName   := 'exporta.json';

  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName) then
      EFilerError.Create('Um arquivo com esse nome já existe, não é possível continuar!');

    FDBatchMoveJSONWriter1.Encoding := TFDEncoding.ecUTF8;
    FDBatchMoveJSONWriter1.FileName := SaveDialog1.FileName;

    FDBatchMove1.Writer := FDBatchMoveJSONWriter1;
    FDBatchMove1.Execute;

    ShowMessage('Arquivo exportado com sucesso');
  end;
end;

procedure TDtmExportaArquivo.SalvarArquivoTexto;
begin
  if QryExportaArquivo.IsEmpty then
    raise EDatabaseError.Create('Nenhum dado foi selecionado, impossível continuar!');

  SaveDialog1.DefaultExt := '*.csv';
  SaveDialog1.Filter     := 'arquivos de texto csv|*.csv';
  SaveDialog1.FileName   := 'exporta.csv';

  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName) then
      EFilerError.Create('Um arquivo com esse nome já existe, não é possível continuar!');

    FDBatchMoveTextWriter1.Encoding               := TFDEncoding.ecANSI;
    FDBatchMoveTextWriter1.DataDef.WithFieldNames := True;
    FDBatchMoveTextWriter1.DataDef.Delimiter      := '"';
    FDBatchMoveTextWriter1.DataDef.Separator      := ';';
    FDBatchMoveTextWriter1.FileName               := SaveDialog1.FileName;

    FDBatchMove1.Writer := FDBatchMoveTextWriter1;
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

