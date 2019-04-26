unit UMoverDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Comp.BatchMove,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TDtmMoverDados = class(TDataModule)
    FDBatchMove1: TFDBatchMove;
    FDConnPostgreSQL: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmMoverDados: TDtmMoverDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
