unit uFactoryClass;

interface
uses
  System.Classes, System.SysUtils, System.Rtti, Generics.collections;
  type
  /// <stereotype>factory</stereotype>
     /// <summary> Interface para Singleton </summary>
  iFactoryClass<T> = interface(TFunc<T>)
  ['{27D5D71E-4AFC-4E3E-BCB2-FEEF207B6419}']
    function Default: T;
    procedure ReleaseInstance;
  end;
  TFactoryClass<T: Class> = class(TInterfacedObject, iFactoryClass<T>)
  private
    FClass: TClass;
    FManufactured: Boolean;
    FInstance: T;
    constructor InternalCreate; reintroduce;
    function Invoke: T;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    class function New(AOwned: boolean = true): TFactoryClass<T>;
    function Default: T;
    procedure Release;
    procedure ReleaseInstance;
  end;

implementation

{ TFactoryClass<T> }
{$WARN DUPLICATE_CTOR_DTOR OFF}

constructor TFactoryClass<T>.InternalCreate;
begin
  inherited Create;
end;

function TFactoryClass<T>.Invoke: T;
begin
  if not assigned(FInstance) then
    FInstance := T(FClass.Create);
    Result := FInstance;
end;

class function TFactoryClass<T>.New(AOwned: boolean): TFactoryClass<T>;
begin
    Result := self.InternalCreate;
    Result.FManufactured := AOwned;
    Result.FClass := TClass(T);
end;

procedure TFactoryClass<T>.Release;
begin
  if assigned(FInstance) then
    FInstance.DisposeOf;
    FInstance := nil;
end;

procedure TFactoryClass<T>.ReleaseInstance;
begin
  if assigned(FInstance) then
    FInstance.DisposeOf;
    FInstance := nil;
end;

constructor TFactoryClass<T>.Create;
begin
  FManufactured := True;
  raise exception.Create('Usar a class function New ao inves de create');
end;

function TFactoryClass<T>.Default: T;
begin
  Result := Invoke;
end;

destructor TFactoryClass<T>.Destroy;
begin
  if FManufactured and assigned(FInstance) then
    FInstance.DisposeOf;
  inherited;
end;

end.

