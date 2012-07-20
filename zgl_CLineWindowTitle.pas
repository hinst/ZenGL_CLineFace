unit zgl_CLineWindowTitle;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  zgl_CLineWidget,
  zgl_primitives_2d,
  zgl_math_2d,
  zgl_font,
  zgl_text;

type

  { TWindowTitle }

  TWindowTitle = class(TWidget)
  public
    constructor Create(const aOwner: TComponent; const aTitle: string);
  private
    fBackgroundColor: LongWord;
    fFontColor: LongWord;
    fFont: zglPFont;
    fTitle: string;
    fHorizontalGap: single;
    fVerticalGap: single;
    const HeightMeasureStr = 'AZ';
  public
    property BackgroundColor: LongWord read fBackgroundColor write fBackgroundColor;
    property FontColor: LongWord read fFontColor write fFontColor;
    property Font: zglPFont read fFont write fFont;
    property Title: string read fTitle write fTitle;
    property HorizontalGap: single read fHorizontalGap write fHorizontalGap;
    property VerticalGap: single read fVerticalGap write fVerticalGap;
    procedure UpdateArea; override;
    procedure Draw; override;
  end;

implementation

uses
  zgl_CLineWindow;

{ TWindowTitle }

constructor TWindowTitle.Create(const aOwner: TComponent; const aTitle: string);
begin
  inherited Create(aOwner);
  fTitle := aTitle;
end;

procedure TWindowTitle.UpdateArea;
begin
  fArea.H := text_GetHeight(Font, TGraphicalWindow(Parent).Area^.W, HeightMeasureStr);
  fArea.H += 2*HorizontalGap;
end;

procedure TWindowTitle.Draw;
var
  textRect: zglTRect;
begin
  pr2d_Rect(fArea.X, fArea.Y, fArea.W, fArea.H, BackgroundColor, 255, PR2D_FILL);
  textRect.X := fArea.X + HorizontalGap;
  textRect.Y := fArea.Y + HorizontalGap;
  textRect.W := fArea.W - 2*HorizontalGap;
  textRect.H := fArea.H - 2*HorizontalGap;
  text_DrawInRectEx(Font, textRect, 1, 0, Title, 255, FontColor,
    TEXT_HALIGN_LEFT or TEXT_VALIGN_CENTER);
end;

end.

