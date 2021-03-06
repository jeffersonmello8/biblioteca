unit data_module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Phys.ODBCBase, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TConexaoBancoDados = class(TDataModule)
    ConexaoSQLServer: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDQuery1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure CriarQuery(var Query : TFDQuery);
  end;

var
  ConexaoBancoDados: TConexaoBancoDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TConexaoBancoDados.CriarQuery(var Query: TFDQuery);
begin
  Query := TFDQuery.Create(Self);
  Query.Connection := ConexaoSQLServer;
end;

procedure TConexaoBancoDados.DataModuleCreate(Sender: TObject);
begin
  ConexaoSQLServer.Connected := True;
end;

end.
