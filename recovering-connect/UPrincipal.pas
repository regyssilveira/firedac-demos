unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    FDConnection1: TFDConnection;
    FDConnection2: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FDConnection2Recover(ASender, AInitiator: TObject;
      AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDQuery1.Open;
  FDQuery2.Open;
end;

procedure TForm1.FDConnection2Recover(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
var
  iRes: Integer;
begin
  iRes := Application.MessageBox(
    'Conexão com banco de dados perdida.' + sLineBreak +
    'Clique em:' + sLineBreak +
    '  Sim para modo Retentar' + sLineBreak +
    '  Não para para Modo Off-line' + sLineBreak +
    '  Cancelar para abortar',
    'Banco de Dados',
    MB_ICONERROR + MB_YESNOCANCEL
  );

  case iRes of
    mrYes:    AAction := faRetry;
    mrOk:     AAction := faOfflineAbort;
    mrCancel: AAction := faFail;
  end;
end;

end.
