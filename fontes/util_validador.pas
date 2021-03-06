unit util_validador;

interface

type
  TValidador = class
  private
  public
    class function ValidarCpf(Cpf : string):Boolean;
  end;

implementation

uses
  SysUtils;

class function TValidador.ValidarCpf(Cpf: string): Boolean;
var
  DigitoVerificadorUm : string;
  DigitoVerificadorDois : string;
  Soma : Integer;
  Indice : Integer;
  Resto : Integer;
  Peso : Integer;
begin
  if ((Cpf = '00000000000') or (Cpf = '11111111111') or
      (Cpf = '22222222222') or (Cpf = '33333333333') or
      (Cpf = '44444444444') or (Cpf = '55555555555') or
      (Cpf = '66666666666') or (Cpf = '77777777777') or
      (Cpf = '88888888888') or (Cpf = '99999999999') or
      (Length(Cpf) <> 11)) then
  begin
    Result := False;
    Exit;
  end;

  try
    Soma := 0;
    Peso := 10;

    for Indice := 1 to 9 do
    begin
      Soma := Soma + (StrToInt(Cpf[Indice]) * Peso);
      Peso := Peso - 1;
    end;

    Resto := 11 - (Soma mod 11);

    if ((Resto = 10) or (Resto = 11)) then
      DigitoVerificadorUm := '0'
    else
      Str(Resto:1, DigitoVerificadorUm);

    Soma := 0;
    Peso := 11;

    for Indice := 1 to 10 do
    begin
      Soma := Soma + (StrToInt(Cpf[Indice]) * Peso);
      Peso := Peso - 1;
    end;

    Resto := 11 - (Soma mod 11);

    if ((Resto = 10) or (Resto = 11)) then
      DigitoVerificadorDois := '0'
    else
      Str(Resto:1, DigitoVerificadorDois);

    if ((DigitoVerificadorUm = Cpf[10]) and (DigitoVerificadorDois = Cpf[11])) then
      Result := True
    else
      Result := False;
  except
    Result := False;
  end;
end;

end.
