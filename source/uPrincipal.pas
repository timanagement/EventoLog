unit uPrincipal;

interface

uses
  System.SysUtils,
  System.Classes,
  uFactoryClass,
  uEventoController;

type
  TEventoLog = class(TComponent)
  private
    Fvmsg: String;
    FData: String;
    FHora: String;
    FCaminhoLog: String; // = 'C:\Log';
    FCabecalho: String;
    FArquivoLog: String; // = 'Base_Clientes_';
  protected
    { Protected declarations }
  public
  constructor Create(AOwner: TComponent); override;
    procedure EventoLog(aCodigo, aDescricao, aMensagem: String);
    procedure evMensagem(Msg: String);
  published
    property ArquivoLog: String read FArquivoLog write FArquivoLog;
    property Cabecalho: String read FCabecalho write FCabecalho;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Host', [TEventoLog]);
end;

{ TEventoLog }

constructor TEventoLog.Create(AOwner: TComponent);
begin
  inherited;
  FArquivoLog := 'Log';
  Self.SetSubComponent(true);
  Self.Name := 'ArquivoLog';
  FCabecalho := Self.FCabecalho;
  Self.Name := 'Cabecalho';
  Self.SetSubComponent(true);
end;

procedure TEventoLog.EventoLog(aCodigo, aDescricao, aMensagem: String);
begin
  FHora := FormatDateTime('[hh:nn:ss]', Now);
  Fvmsg := Format('%s %s - %s => %s', [FHora, aCodigo, aDescricao, aMensagem]);
  TFactoryClass<TEventoController>.New().Default.Msg := Fvmsg;
  Self.evMensagem(Fvmsg);
end;

procedure TEventoLog.evMensagem(Msg: String);
begin
  FCaminhoLog := ExtractFilePath(ParamStr(0));
  FData := FormatDateTime('ddmmYYYY', Now);
  TFactoryClass<TEventoController>.New().Default.CabecalhoLog(FCabecalho);
  TFactoryClass<TEventoController>.New().Default.CriarLog(FCaminhoLog,
    FArquivoLog + '_' + FData, FCabecalho, Msg);
end;

end.
