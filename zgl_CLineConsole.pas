unit zgl_CLineConsole;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  zgl_main,
  zgl_utils,
  zgl_font,
  zgl_timers,
  zgl_CLineWindow,
  zgl_CLineStyle;

type

  { TConsoleWindow }

  TConsoleWindow = class(TGraphicalWindow)
  public
    procedure LoadStyle(const aStyle: TFaceStyle);
  private
    fFont: zglPFont;
    fFPS: integer;
  public
    property Font: zglPFont read fFont write fFont;
    procedure Draw; override;
  end;

implementation

{ TConsoleWindow }

procedure TConsoleWindow.LoadStyle(const aStyle: TFaceStyle);
begin
  inherited LoadStyle(aStyle);
  fFont := aStyle.StandardFont;
end;

procedure TConsoleWindow.Draw;
begin
  WindowTitle.RightText := u_IntToStr( zgl_Get( RENDER_FPS ) );
  inherited Draw;
end;

end.

