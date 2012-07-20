{$i ZenGL_ObjectFiles.inc}

program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
    cthreads,
  {$ENDIF}
  Classes,
  { you can add units after this }
  zgl_main,
  zgl_screen,
  zgl_window,
  zgl_text,
  zgl_textures,
  zgl_textures_tga,
  zgl_font,
  zgl_render_2d,
  zgl_CLineWindow,
  zgl_CLineStyle,
  zgl_CLineLimeStlye,
  zgl_CLineConsole;

var
  style: TFaceStyle;
  conwindow: TConsoleWindow;

procedure DoOnEngineInitialize;
begin
  style := CreateCLineLimeStyle('LimeStyle\', nil);
  conwindow := TConsoleWindow.Create(nil);
  conwindow.LoadStyle(style);
  conwindow.Title := 'Типа консоль';
  // fill 80% of the screen with our precious console window
  conwindow.PlaceAtScreenCenter(0.8);
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
  style.Free;
end;

begin
  scr_SetOptions(1024, 720, REFRESH_DEFAULT, false, false);
  zgl_Reg(SYS_LOAD, @DoOnEngineInitialize);
  zgl_Reg(SYS_DRAW, @DoOnEngineDraw);
  zgl_Reg(SYS_EXIT, @DoOnEngineFinalize);
  zgl_Init;
end.

