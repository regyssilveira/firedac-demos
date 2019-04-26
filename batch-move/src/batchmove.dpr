program batchmove;

uses
  Vcl.Forms,
  UBasePrincipal in '..\..\comuns\UBasePrincipal.pas' {FrmBasePrincipal},
  UConfig in '..\..\comuns\UConfig.pas',
  UConnection in '..\..\comuns\UConnection.pas' {DtmConnection: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UExportaArquivo in 'UExportaArquivo.pas' {DtmExportaArquivo: TDataModule},
  UImportaArquivo in 'UImportaArquivo.pas' {DtmImportaArquivo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDtmConnection, DtmConnection);
  Application.CreateForm(TDtmExportaArquivo, DtmExportaArquivo);
  Application.CreateForm(TDtmImportaArquivo, DtmImportaArquivo);
  Application.Run;
end.
