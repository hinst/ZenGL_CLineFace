unit zgl_CLineWindowTitle;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  zgl_CLineWidget,
  zgl_primitives_2d,
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
    const HeightMeasureStr = 'AZ';
    const HorizontalGap = 1;
  public
    property BackgroundColor: LongWord read fBackgroundColor write fBackgroundColor;
    property FontColor: LongWord read fFontColor write fFontColor;
    property Font: zglPFont read fFont write fFont;
    property Title: string read fTitle write fTitle;
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
begin
  pr2d_Rect(fArea.X, fArea.Y, fArea.W, fArea.H, BackgroundColor, 255, PR2D_FILL);
end;

end.

