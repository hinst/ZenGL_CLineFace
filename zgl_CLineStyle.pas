unit zgl_CLineStyle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  zgl_font;

type

  TWindowStyle = record
    TitleFont: zglPFont;
    HTitleGap: single;
    VTitleGap: single;
  end;

  PWindowStyle = ^TWindowStyle;

  { TFaceStyle }

  TFaceStyle = class(TComponent)
  private
    fStandardFont: zglPFont;
    fWindow: TWindowStyle;
  public
    property StandardFont: zglPFont read fStandardFont write fStandardFont;
    property Window: TWindowStyle read fWindow write fWindow;
    destructor Destroy; override;
  end;

implementation

{ TFaceStyle }

destructor TFaceStyle.Destroy;
begin
  inherited Destroy;
end;

end.

