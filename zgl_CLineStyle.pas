unit zgl_CLineStyle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  zgl_font;

type

  TWindowStyle = record
    TitleBackgroundColor: LongWord;
    TitleFontColor: LongWord;
    TitleFont: zglPFont;
    HTitleGap: single;
    VTitleGap: single;
    FrameColor: LongWord;
  end;

  PWindowStyle = ^TWindowStyle;

  { TFaceStyle }

  TFaceStyle = class(TComponent)
  private
    fStandardFont: zglPFont;
    fWindow: TWindowStyle;
    function GetWindow: PWindowStyle;
  public
    property StandardFont: zglPFont read fStandardFont write fStandardFont;
    property Window: PWindowStyle read GetWindow;
    destructor Destroy; override;
  end;

implementation

{ TFaceStyle }

function TFaceStyle.GetWindow: PWindowStyle;
begin
  result := @fWindow;
end;

destructor TFaceStyle.Destroy;
begin
  inherited Destroy;
end;

end.

