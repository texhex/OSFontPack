; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS

; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS











;General procedure
; a) Welcome page (might be disabled later on)
; b) License is shown
; c) Readme is displayed


  

[Setup]
AppId=OSFontPack
SetupMutex=OSFontPack_Setup_Mutex 

AppName=Open Source Font Pack
AppVersion=0.3.5
VersionInfoVersion=0.3.5

AppPublisher=Michael 'Tex' Hex
AppSupportURL=https://github.com/texhex/OSFontPack
AppComments=Installs several open source fonts

;Target folder settings
DefaultDirName={pf}\Open Source Font Pack\
DirExistsWarning=no

;Always create a log to aid troubleshooting. The file is created as:  
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

;Only include LicenseFile and InfoBeforeFile when using a release build

;Ignore some screens
DisableDirPage=yes
DisableProgramGroupPage=yes
AllowCancelDuringInstall=False

[Types]
Name: "full"; Description: "Full: Install all fonts"
Name: "custom"; Description: "Custom: Select fonts to install"; Flags: iscustom

[Components]
Name: "hack"; Description: "Hack by Christopher Simpkins"; Types: full; Flags: disablenouninstallwarning;


[Files]
;Copy license files - always copied
Source: "licenses/*.*"; DestDir: "{app}"; Flags: ignoreversion;

;Copy Hack font files to internal temp folder to perform SHA1 file hash check
  Source: "fonts\Hack_v2_010\Hack-Bold.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Components: hack; AfterInstall: AddTempFontFile 
  Source: "fonts\Hack_v2_010\Hack-BoldOblique.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Components: hack; AfterInstall: AddTempFontFile 
  Source: "fonts\Hack_v2_010\Hack-Regular.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Components: hack; AfterInstall: AddTempFontFile 
  Source: "fonts\Hack_v2_010\Hack-RegularOblique.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Components: hack; AfterInstall: AddTempFontFile 


;Now check which font we should install (if any) by checking the hash for the copied files to the files found in {fonts}
;For this we are using a placeholder file that is only installed to {tmp} 
;It will be deleted at the end of the setup
Source: "src\CHECK FONT FILES"; DestDir: "{tmp}"; Flags: ignoreversion; AfterInstall: CheckFontFiles; 



;Source: "OZHANDIN.TTF"; DestDir: "{fonts}"; FontInstall: "Oz Handicraft BT"; Flags:  ignoreversion fontisnttruetype restartreplace;

;Copy open source fonts

;Source: "files\Hack_2.018\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;
;Source: "files\Lato_2.0\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;
;Source: "files\SourceCodePro_2.010\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;
;Source: "files\SourceSansPro_2.020\*.ttf"; DestDir: "{fonts}"; Flags: ignoreversion restartreplace;


 
[INI]
;Create an ini to make detection for enterprise deployment tools easy
Filename: "{app}\InstallInfo.ini"; Section: "Main"; Key: "Version"; String: "0.3.5"

[UninstallDelete]
;Delete Install Info
Type: files; Name: "{app}\InstallInfo.ini"


[Code]
var
  FontFilesInTempFolder: array of string;
  FontFilesInTempFolder_HashValues: array of string;
  FontFilesInWindows_HashValue: array of string;


procedure AddTempFontFile();
var
 fullFileName:string;
 arraySize:integer;
begin
  fullfilename:=ExpandConstant(CurrentFileName);
  log('Added file to TEMP list: ' + fullFileName);

  arraySize:=GetArrayLength(FontFilesInTempFolder);
  SetArrayLength(FontFilesInTempFolder, arraySize+1);

  FontFilesInTempFolder[arraySize]:=fullFileName;   
end;


procedure CheckFontFiles();
var
 i:integer;
 curFontFile:string;
 curFontFileWindows:string;
begin
 log('CheckFontFiles() called...');

 SetArrayLength(FontFilesInTempFolder_HashValues, GetArrayLength(FontFilesInTempFolder));
 SetArrayLength(FontFilesInWindows_HashValue, GetArrayLength(FontFilesInTempFolder));

 for i := 0 to GetArrayLength(FontFilesInTempFolder)-1 do begin
     curFontFile:=ExtractFileName(FontFilesInTempFolder[i]);

     log('SHA1 hash check of '+curFontFile);
      
     FontFilesInTempFolder_HashValues[i]:=GetSHA1OfFile(FontFilesInTempFolder[i]);
     log('   File from SETUP:  ' +  FontFilesInTempFolder_HashValues[i]);
     
     curFontFileWindows:=ExpandConstant('{fonts}\'+curFontFile);

     if FileExists(curFontFileWindows) then begin
        FontFilesInWindows_HashValue[i]:=GetSHA1OfFile(curFontFileWindows);
     end else begin
        FontFilesInWindows_HashValue[i]:='-NOT FOUND-';
     end;
     
     log('   File in FONTS  :  ' +  FontFilesInWindows_HashValue[i]);
 end;

 Sleep(2000);
end;





