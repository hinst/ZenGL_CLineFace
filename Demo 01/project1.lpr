program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
    cthreads,
  {$ENDIF}
  Classes,
  Graphics,
  { you can add units after this }
  zgl_main,
  zgl_screen,
  zgl_window,
  zgl_text,
  zgl_textures,
  zgl_textures_tga,
  zgl_font,
  zgl_render_2d,
  zgl_CLineWindow;

var
  conwindow: TGraphicalWindow;
  justFont: zglPFont;

procedure DoOnEngineInitialize;
begin
  justFont := font_LoadFromFile('Consolas-10pt.zfi');
  conwindow := TGraphicalWindow.Create(nil);
  conwindow.Title := 'Типа консоль';
  conwindow.WindowTitle.Font := justFont;
  // fill 80% of the screen with our precious console window
  conwindow.PlaceAtScreenCenter(0.8);
  // Assign colors
  conwindow.FrameColor := clLime; // why not
  conwindow.WindowTitle.BackgroundColor := clLime;
  conwindow.WindowTitle.FontColor := clBlack;
  conwindow.Font := justFont;
end;

procedure DoOnEngineDraw;
begin
  batch2d_Begin;
  conwindow.Draw;
  batch2d_End;
end;

procedure DoOnEngineFinalize;
begin
  conwindow.Free;
end;

begin
  scr_SetOptions(800, 600, REFRESH_DEFAULT, false, false);
  zgl_Reg(SYS_LOAD, @DoOnEngineInitialize);
  zgl_Reg(SYS_DRAW, @DoOnEngineDraw);
  zgl_Reg(SYS_EXIT, @DoOnEngineFinalize);
  zgl_Init;
end.

