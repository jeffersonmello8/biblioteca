unit formulario_cadastro_leitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ComCtrls, entidade_leitor;

type
  TFormularioCadastroLeitor = class(TForm)
    GrupoRegistro: TGroupBox;
    TextoCodigo: TLabel;
    CampoCodigo: TEdit;
    TextoNome: TLabel;
    CampoNome: TEdit;
    TextoEndereco: TLabel;
    CampoEndereco: TEdit;
    TextoTelefone: TLabel;
    TextoCpf: TLabel;
    TextoDataNascimento: TLabel;
    CampoDataNascimento: TMaskEdit;
    CampoTelefone: TMaskEdit;
    CampoCpf: TMaskEdit;
    TextoEstadoCivil: TLabel;
    CampoEstadoCivil: TComboBox;
    TextoEscolaridade: TLabel;
    CampoEscolaridade: TComboBox;
    TextoAtivo: TLabel;
    CampoAtivo: TComboBox;
    GrupoAcoes: TGroupBox;
    BotaoIncluir: TBitBtn;
    BotaoSalvar: TBitBtn;
    BotaoCancelar: TBitBtn;
    BotaoConsultar: TBitBtn;
    BotaoEditar: TBitBtn;
    BotaoExcluir: TBitBtn;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BotaoIncluirClick(Sender: TObject);
    procedure BotaoSalvarClick(Sender: TObject);
    procedure BotaoCancelarClick(Sender: TObject);
    procedure BotaoConsultarClick(Sender: TObject);
    procedure BotaoEditarClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
  private
    procedure LimparFormulario;
    procedure HabilitarEdicao;
    procedure DesabilitarEdicao;
    procedure CarregarLeitor(Leitor : TLeitor);
  public

  end;

var
  FormularioCadastroLeitor: TFormularioCadastroLeitor;

implementation

{$R *.dfm}

uses constante_estado_civil, constante_escolaridade, constante_ativo,
  util_dialogo, dao_leitor, formulario_consulta_leitor;

procedure TFormularioCadastroLeitor.BotaoCancelarClick(Sender: TObject);
var
  Leitor : TLeitor;
begin
  if Trim(CampoCodigo.Text) = '' then
  begin
    LimparFormulario();
  end
  else
  begin
    Leitor := TLeitorDAO.RecuperarPorCodigo(StrToIntDef(CampoCodigo.Text, 0));

    if Leitor <> nil then
      CarregarLeitor(Leitor);
  end;

  DesabilitarEdicao();
end;

procedure TFormularioCadastroLeitor.BotaoConsultarClick(Sender: TObject);
begin
  if FormularioConsultaLeitor = nil then
      Application.CreateForm(TFormularioConsultaLeitor, FormularioConsultaLeitor);

  FormularioConsultaLeitor.Leitor.Codigo := -1;
  FormularioConsultaLeitor.ShowModal();

  if FormularioConsultaLeitor.Leitor.Codigo <> -1 then
  begin
    CarregarLeitor(FormularioConsultaLeitor.Leitor);
    DesabilitarEdicao();
  end;
end;

procedure TFormularioCadastroLeitor.BotaoEditarClick(Sender: TObject);
begin
  HabilitarEdicao();
end;

procedure TFormularioCadastroLeitor.BotaoExcluirClick(Sender: TObject);
begin
  if TDialogo.Confirmar('Confirma a exclus�o do leitor?') then
  begin
    TLeitorDAO.Excluir(StrToIntDef(CampoCodigo.Text, 0));
    LimparFormulario();
    DesabilitarEdicao();
    TDialogo.Informar('Leitor exclu�do com sucesso.');
  end;
end;

procedure TFormularioCadastroLeitor.BotaoIncluirClick(Sender: TObject);
begin
  LimparFormulario();
  HabilitarEdicao();
end;

procedure TFormularioCadastroLeitor.BotaoSalvarClick(Sender: TObject);
var
  Leitor : TLeitor;
begin
  Leitor := TLeitor.Create();

  Leitor.Codigo := StrToIntDef(CampoCodigo.Text, 0);
  Leitor.Nome := CampoNome.Text;
  Leitor.Endereco := CampoEndereco.Text;
  Leitor.Telefone := CampoTelefone.Text;
  Leitor.Cpf := CampoCpf.Text;
  Leitor.DataNascimento := StrToDateDef(CampoDataNascimento.Text, 0);
  Leitor.EstadoCivil := CampoEstadoCivil.ItemIndex;
  Leitor.Escolaridade := CampoEscolaridade.ItemIndex;
  Leitor.Ativo := CampoAtivo.ItemIndex;

  if Leitor.IsValido() then
  begin
    TLeitorDAO.Gravar(Leitor);
    CampoCodigo.Text := Leitor.Codigo.ToString();
    TDialogo.Informar('Leitor gravado com sucesso.');
    DesabilitarEdicao();
  end;

  FreeAndNil(Leitor);
end;

procedure TFormularioCadastroLeitor.CarregarLeitor(Leitor: TLeitor);
begin
  CampoCodigo.Text := Leitor.Codigo.ToString();
  CampoNome.Text := Leitor.Nome;
  CampoEndereco.Text := Leitor.Endereco;
  CampoTelefone.Text := Leitor.Telefone;
  CampoCpf.Text := Leitor.Cpf;

  if Leitor.DataNascimento <> 0 then
  begin
    CampoDataNascimento.Text := FormatDateTime('dd/mm/yyyy', Leitor.DataNascimento);
  end
  else
  begin
    CampoDataNascimento.Text := '  /  /    ';
  end;

  CampoEstadoCivil.ItemIndex := Leitor.EstadoCivil;
  CampoEscolaridade.ItemIndex := Leitor.Escolaridade;
  CampoAtivo.ItemIndex := Leitor.Ativo;
end;

procedure TFormularioCadastroLeitor.DesabilitarEdicao;
begin
  GrupoRegistro.Enabled := False;
  BotaoSalvar.Enabled := False;
  BotaoCancelar.Enabled := False;

  BotaoIncluir.Enabled := True;
  BotaoConsultar.Enabled := True;
  BotaoEditar.Enabled := Trim(CampoCodigo.Text) <> '';
  BotaoExcluir.Enabled := Trim(CampoCodigo.Text) <> '';
end;

procedure TFormularioCadastroLeitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormularioCadastroLeitor.FormDestroy(Sender: TObject);
begin
  FormularioCadastroLeitor := nil;
end;

procedure TFormularioCadastroLeitor.FormShow(Sender: TObject);
begin
  DesabilitarEdicao();
end;

procedure TFormularioCadastroLeitor.HabilitarEdicao;
begin
  GrupoRegistro.Enabled := True;
  BotaoSalvar.Enabled := True;
  BotaoCancelar.Enabled := True;

  BotaoIncluir.Enabled := False;
  BotaoConsultar.Enabled := False;
  BotaoEditar.Enabled := False;
  BotaoExcluir.Enabled := False;

  CampoNome.SetFocus();
end;

procedure TFormularioCadastroLeitor.LimparFormulario;
begin
  CampoCodigo.Text := '';
  CampoNome.Text := '';
  CampoEndereco.Text := '';
  CampoTelefone.Text := '';
  CampoCpf.Text := '';
  CampoDataNascimento.Text := '';
  CampoEstadoCivil.ItemIndex := EC_NAO_INFORMADO;
  CampoEscolaridade.ItemIndex := E_NAO_INFORMADA;
  CampoAtivo.ItemIndex := A_SIM;
end;

end.
