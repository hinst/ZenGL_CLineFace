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
  zgl_font,
  zgl_render_2d,
  zgl_CLineWindow;

var
  conwindow: TGraphicalWindow;

procedure DoOnEngineInitialize;
begin
  conwindow := TGraphicalWindow.Create(nil);
  // fill 80% of the screen with our precious console window
  conwindow.PlaceAtScreenCenter(0.8);
  conwindow.FrameColor := clLime; // why not
  conwindow.Font := font_LoadFromFile('font.zfi');
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

