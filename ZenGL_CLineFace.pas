{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ZenGL_CLineFace;

interface

uses
  zgl_CLineWindow, zgl_CLineWidget, zgl_CLineWindowTitle, zgl_CLineStyle, 
  zgl_CLineLimeStlye, zgl_CLineConsole, zgl_Colors, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('ZenGL_CLineFace', @Register);
end.
