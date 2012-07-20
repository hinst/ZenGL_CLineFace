unit zgl_CLineWindow;

{$mode objfpc}{$H+}

interface

uses
  Types, Classes, SysUtils,
  {$REGION 'Use all the ZenGL stuff'}
  zgl_main,
  zgl_screen,
  zgl_window,
  zgl_keyboard,
  zgl_render_2d,
  zgl_fx,
  zgl_primitives_2d,
  zgl_textures,
  zgl_font,
  zgl_text,
  zgl_math_2d
  {$ENDREGION},
  zgl_CLineWidget
;

type

  { TGraphicalWindow }

  TGraphicalWindow = class(TWidget, ISupportsClientArea)
  private
    fFont: zglPFont;
    fFrameColor: LongWord;
    fFrameWidth: single;
    fClientArea: zglTRect;
    procedure DrawFrame;
    function GetClientArea: zglPRect;
  public
    property Font: zglPFont read fFont write fFont;
    property FrameColor: LongWord read fFrameColor write fFrameColor;
    procedure UpdateArea; override;
    procedure Draw; override;
    procedure PlaceAtScreenCenter(const aFraction: single);
    destructor Destroy; override;
  end;

implementation

{ TGraphicalWindow }

procedure TGraphicalWindow.DrawFrame;
begin
  pr2d_Rect(fArea.X, fArea.Y, fArea.W, fArea.H, FrameColor);
end;

function TGraphicalWindow.GetClientArea: zglPRect;
begin
  result := @fClientArea;
end;

procedure TGraphicalWindow.UpdateArea;
begin
  fClientArea.X := fArea.X + 1;
  fClientArea.Y := fArea.Y + 1;
  fClientArea.W := fArea.W - 2;
  fClientArea.H := fArea.H - 2;
end;

procedure TGraphicalWindow.Draw;
begin
  DrawFrame;
end;

procedure TGraphicalWindow.PlaceAtScreenCenter(const aFraction: single);
begin
  fArea.W := wndWidth * aFraction;
  fArea.H := wndHeight * aFraction;
  fArea.X := (wndWidth - fArea.W) / 2;
  fArea.Y := (wndHeight - fArea.H) / 2;
  UpdateArea;
end;

destructor TGraphicalWindow.Destroy;
begin
  inherited Destroy;
end;

end.

