unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Error, FireDAC.VCLUI.Login, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    BtnAplicarAlteracoes: TButton;
    DtsMestre: TDataSource;
    DtsDetalhe: TDataSource;
    QryMestre: TFDQuery;
    QryDetalhe: TFDQuery;
    QryMestreID_MESTRE: TIntegerField;
    QryMestreDESCRICAO: TStringField;
    QryDetalheID_MESTRE: TIntegerField;
    QryDetalheID_ITEM: TIntegerField;
    QryDetalheDESCRICAO: TStringField;
    QryDetalheVALOR: TFMTBCDField;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure BtnAplicarAlteracoesClick(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FDConnection1BeforeConnect(Sender: TObject);
begin
  FDConnection1.Params.Values['database'] := ExtractFilePath(ParamStr(0)) + 'database\mestredetalhe.fdb';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  QryMestre.Open;
  QryDetalhe.Open;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDConnection1.Close;
end;

procedure TForm2.BtnAplicarAlteracoesClick(Sender: TObject);
begin
  FDSchemaAdapter1.ApplyUpdates;
end;

procedure TForm2.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
  QryMestre.CommitUpdates;
  QryDetalhe.CommitUpdates;
end;

end.
