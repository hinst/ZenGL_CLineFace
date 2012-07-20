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
  zgl_CLineWidget,
  zgl_CLineWindowTitle
;

type

  { TGraphicalWindow }

  TGraphicalWindow = class(TWidget, ISupportsClientArea)
  public
    constructor Create(const aOwner: TComponent);
  private
    fFont: zglPFont;
    fFrameColor: LongWord;
    fFrameWidth: single;
    fClientArea: zglTRect;
    fWindowTitle: TWindowTitle;
    function GetTitle: string;
    procedure SetTitle(const aTitle: string);
    procedure Initialize;
    procedure DrawFrame;
    function GetClientArea: zglPRect;
  public
    property Font: zglPFont read fFont write fFont;
    property FrameColor: LongWord read fFrameColor write fFrameColor;
    property Title: string read GetTitle write SetTitle;
    property WindowTitle: TWindowTitle read fWindowTitle;
    procedure UpdateArea; override;
    procedure Draw; override;
    procedure PlaceAtScreenCenter(const aFraction: single);
    destructor Destroy; override;
  end;

implementation

{ TGraphicalWindow }

constructor TGraphicalWindow.Create(const aOwner: TComponent);
begin
  inherited Create(aOwner);
  Initialize;
end;

function TGraphicalWindow.GetTitle: string;
begin
  result := WindowTitle.Title;
end;

procedure TGraphicalWindow.SetTitle(const aTitle: string);
begin
  WindowTitle.Title := aTitle;
end;

procedure TGraphicalWindow.Initialize;
begin
  fWindowTitle := TWindowTitle.Create(self, '');
  WindowTitle.Parent := self;
end;

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
  WindowTitle.Area^.X := fArea.X;
  WindowTitle.Area^.Y := fArea.Y;
  WindowTitle.Area^.W := fArea.W;
  WindowTitle.UpdateArea;
end;

procedure TGraphicalWindow.Draw;
begin
  DrawFrame;
  WindowTitle.Draw;
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

