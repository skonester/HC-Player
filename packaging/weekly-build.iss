; CI-built installer for the weekly dev build. Packages the Portable|x64
; MSBuild output into one self-contained Setup .exe. Unsigned, unofficial --
; the real v* releases use a separate, hand-built installer.

#ifndef SourceDir
  #define SourceDir "..\build-output"
#endif
#ifndef AppVersion
  #define AppVersion "0.0.0-dev"
#endif

[Setup]
AppId={{B6B3B6A0-9C7D-4C1E-9F2A-7B7E6A2C9D10}
AppName=HC Player (Weekly Dev Build)
AppVersion={#AppVersion}
AppPublisher=skonester
DefaultDirName={autopf}\HC Player Weekly
DefaultGroupName=HC Player Weekly
DisableProgramGroupPage=yes
Compression=lzma2
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputBaseFilename=HC-Player-Setup
UninstallDisplayIcon={app}\HC Player.exe

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Icons]
Name: "{group}\HC Player"; Filename: "{app}\HC Player.exe"
Name: "{group}\Uninstall HC Player"; Filename: "{uninstallexe}"
Name: "{autodesktop}\HC Player"; Filename: "{app}\HC Player.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional shortcuts:"

[Run]
Filename: "{app}\HC Player.exe"; Description: "Launch HC Player"; Flags: nowait postinstall skipifsilent
