; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS

; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS










;#define public OutfileFilename 'FontsEx_' + ProgramVersion + '_A'

;#define public StartFileCommand 'i_view32.exe ""%1""'

;Placeholder to define the macro, will be overwritten later
;#define public FileExtension "XXXTestOnlyXXX"

;#sub RegFileAssoc
;   Root: HKCR; Subkey: "{#FileExtension}"; ValueType: string; ValueName: ; ValueData: "IrfanViewDefaultFile";
;   Root: HKCR; Subkey: "{#FileExtension}\shell"; ValueType: string; ValueName: ; ValueData: "open";
;   Root: HKCR; Subkey: "{#FileExtension}\shell\open"; ValueType: string; ValueName: ; ValueData: "&Open";
;   Root: HKCR; Subkey: "{#FileExtension}\shell\open\command"; ValueType: string; ValueName: ; ValueData: "{#StartFileCommand}";
;   Root: HKCR; Subkey: "{#FileExtension}\OpenWithProgIds"; ValueType: string; ValueName: "IrfanViewDefaultFile" ; ValueData: ""
;#endsub


;General procedure
; a) Welcome page (might be disabled later on)
; b) License is shown
; c) Readme is displayed


  

[Setup]
AppId=OSFontPack
SetupMutex=OSFontPack_Setup_Mutex 

AppName=Open Source Font Pack
AppVersion=0.3.3
VersionInfoVersion=0.3.3

AppPublisher=Michael 'Tex' Hex
AppSupportURL=https://github.com/texhex/OSFontPack
AppComments=Installs several open source fonts

;Target folder settings
DefaultDirName={pf}\Open Source Font Pack\
DirExistsWarning=no

;Always create a log to aid trouble shooting. The file is created as:  
;C:\Users\<YourUsername>\AppData\Local\Temp\Setup Log Year-Month-Day #XXX.txt
SetupLogging=Yes

;enable 64bit Mode so the files are installed to C:\Program Files in x86 and x64 mode
ArchitecturesInstallIn64BitMode=x64 
;Only allow the installer to run on Windows 7 and upwards
MinVersion=6.1

;Folder configuration
SourceDir=..\
OutputDir=out\
OutputBaseFilename=OSFontPack

;the file should be uninstallable
Uninstallable=Yes 

Compression=lzma2/ultra
SolidCompression=yes

PrivilegesRequired=admin

;Might be disabled later on
;IGNORED FOR DEVELOPMENT; DisableWelcomePage=no
;License information
;IGNORED FOR DEVELOPMENT; ;LicenseFile=licenses\license.txt
;readme
;IGNORED FOR DEVELOPMENT; InfoBeforeFile=readme.md

;Ignore some screens
DisableDirPage=yes
DisableProgramGroupPage=yes
AllowCancelDuringInstall=False



[Files]
;Copy license files - always copied
Source: "licenses/*.*"; DestDir: "{app}"; Flags: ignoreversion;

;Copy hack to internal temp folder to perform SHA1 file hash check
  Source: "fonts\Hack_v2_010\Hack-Bold.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Check: AddTempFontFile('{tmp}\Hack-Bold.ttf')
  Source: "fonts\Hack_v2_010\Hack-BoldOblique.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Check: AddTempFontFile('{tmp}\Hack-BoldOblique.ttf')
  Source: "fonts\Hack_v2_010\Hack-Regular.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Check: AddTempFontFile('{tmp}\Hack-Regular.ttf')
  Source: "fonts\Hack_v2_010\Hack-RegularOblique.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Check: AddTempFontFile('{tmp}\Hack-RegularOblique.ttf')

;Source: "OZHANDIN.TTF"; DestDir: "{fonts}"; FontInstall: "Oz Handicraft BT"; Flags:  ignoreversion fontisnttruetype restartreplace;

;Copy open source fonts

;Source: "files\Hack_2.018\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;
;Source: "files\Lato_2.0\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;
;Source: "files\SourceCodePro_2.010\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;
;Source: "files\SourceSansPro_2.020\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;


 
[INI]
;Create an ini to make detection for enterprise deployment tools easy
Filename: "{app}\InstallInfo.ini"; Section: "Main"; Key: "Version"; String: "0.3.3"

[UninstallDelete]
;Delete Install Info
Type: files; Name: "{app}\InstallInfo.ini"


[Code]
var
  FontFilesInTempFolder: array of string;



function AddTempFontFile(filename: String): Boolean;
var
 fullFileName:string;
 hashvalue:string;
 arraysize:integer;
begin
  fullfilename:=ExpandConstant(filename);
  log('Added file to TEMP list: ' + fullFileName);

  arraysize:=GetArrayLength(FontFilesInTempFolder);
  SetArrayLength(FontFilesInTempFolder, arraysize+1);

  FontFilesInTempFolder[arraysize]:=fullFileName;   

    
  result:=true;
end;






