unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBasePrincipal, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPrincipal = class(TFrmBasePrincipal)
    Button1: TButton;
    Button2: TButton;
    QryNumeros: TFDQuery;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure AdicionarCamposMemo(const ADataset: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFBConnection, System.TypInfo;

{$R *.dfm}

procedure TFrmPrincipal.AdicionarCamposMemo(const ADataset: TDataSet);
var
  FieldAtu: TField;
begin
  Memo1.Lines.BeginUpdate;
  try
    for FieldAtu in ADataset.Fields do
    begin
      Memo1.Lines.Add(
        FieldAtu.FieldName + ' - ' +
        GetEnumName(TypeInfo(TFieldType), Integer(FieldAtu.DataType))
      );
    end;
  finally
    Memo1.Lines.Add('');
    Memo1.Lines.EndUpdate;
  end;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add('Campos sem datamapping');

  DtmFBConnection.FDConnection1.Close;
  DtmFBConnection.FDConnection1.FormatOptions.OwnMapRules := False;
  DtmFBConnection.FDConnection1.FormatOptions.MapRules.Clear;

  QryNumeros.Open;
  AdicionarCamposMemo(QryNumeros);
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add('Campos com datamapping');

  DtmFBConnection.FDConnection1.Close;
  DtmFBConnection.FDConnection1.FormatOptions.OwnMapRules := True;
  DtmFBConnection.FDConnection1.FormatOptions.MapRules.Clear;

  with DtmFBConnection.FDConnection1.FormatOptions.MapRules.Add do
  begin
    SourceDataType := dtInt16;
    TargetDataType := dtInt64;
  end;

  with DtmFBConnection.FDConnection1.FormatOptions.MapRules.Add do
  begin
    SourceDataType := dtInt32;
    TargetDataType := dtInt64;
  end;

  with DtmFBConnection.FDConnection1.FormatOptions.MapRules.Add do
  begin
    SourceDataType := dtBcd;
    TargetDataType := dtDouble;
  end;

  QryNumeros.Open;
  AdicionarCamposMemo(QryNumeros);
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
