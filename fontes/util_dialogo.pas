unit util_dialogo;

interface

type
  TDialogo = class
  private
  public
    class procedure Informar(Mensagem : string);
    class function Confirmar(Mensagem : string):Boolean;
  end;

implementation

uses
  Forms, Windows;

class function TDialogo.Confirmar(Mensagem: string): Boolean;
begin
  Result := Application.MessageBox(PWideChar(Mensagem), 'Confirmação',
    MB_YESNO + MB_ICONQUESTION) = ID_YES;
end;

class procedure TDialogo.Informar(Mensagem: string);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
end;

end.
