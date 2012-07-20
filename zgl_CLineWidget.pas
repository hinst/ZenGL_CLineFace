unit zgl_CLineWidget;

{$mode objfpc}{$H+}
{$interface CORBA}

interface

uses
  Classes, SysUtils,
  zgl_math_2d;

type

  { TWidget }

  TWidget = class(TComponent)
  public
    constructor Create(const aOwner: TComponent); reintroduce;
  protected
    fArea: zglTRect;
    fParent: TWidget;
    function GetArea: zglPRect;
  public
    property Area: zglPRect read GetArea;
    property Parent: TWidget read fParent write fParent;
    procedure UpdateArea; virtual; abstract;
    procedure Draw; virtual; abstract;
    destructor Destroy; override;
  end;

  ISupportsClientArea = interface
    function GetClientArea: zglPRect;
    property ClientArea: zglpRect read GetClientArea;
  end;

implementation

{ TWidget }

constructor TWidget.Create(const aOwner: TComponent);
begin
  inherited Create(aOwner);
end;

function TWidget.GetArea: zglPRect;
begin
  result := @fArea;
end;

destructor TWidget.Destroy;
begin
  inherited Destroy;
end;

end.

