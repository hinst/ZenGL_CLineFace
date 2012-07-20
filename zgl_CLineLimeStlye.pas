unit zgl_CLineLimeStlye;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  zgl_Colors,
  zgl_CLineStyle,
  zgl_font;

function CreateCLineLimeStyle(const aPath: string; const aOwner: TComponent): TFaceStyle;
procedure LoadCLineLimeStyle(const aPath: string; const aStyle: TFaceStyle);

implementation

function CreateCLineLimeStyle(const aPath: string; const aOwner: TComponent): TFaceStyle;
begin
  result := TFaceStyle.Create(aOwner);
  LoadCLineLimeStyle(aPath, result);
end;

procedure LoadCLineLimeStyle(const aPath: string; const aStyle: TFaceStyle);
begin
  with aStyle do
    // CLine Lime Style:
  begin
    // Standard Font is Consolas 10pt
    StandardFont := font_LoadFromFile(aPath + 'Consolas-10pt.zfi');
    with Window^ do
    begin
      TitleBackgroundColor := clLime;
      TitleFontColor := clBlack;
      TitleFont := font_LoadFromFile(aPath + 'Cambria-12pt.zfi');
      HTitleGap := 5;
      VTitleGap := 5;
      FrameColor := clLime;
    end;
  end;
end;

end.

