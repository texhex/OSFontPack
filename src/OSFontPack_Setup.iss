#include <ISPPBuiltins.iss>

#pragma option -v+
#pragma verboselevel 9

//Disable the following line when releasing the setup
//----------------------------
#define DEBUG
//----------------------------

#define public Version '0.3.5'


//Definition for Hack Font
#define hack_sourcefolder 'Hack_v2_010'

#dim hack_filenames[4]
#define hack_filenames[0] 'Hack-Bold'
#define hack_filenames[1] 'Hack-BoldOblique'
#define hack_filenames[2] 'Hack-Regular'
#define hack_filenames[3] 'Hack-RegularOblique'

#dim hack_fontnames[4]
#define hack_fontnames[0] 'Hack Bold (OpenType)'
#define hack_fontnames[1] 'Hack Bold Italic (OpenType)'
#define hack_fontnames[2] 'Hack Regular (OpenType)'
#define hack_fontnames[3] 'Hack Italic (OpenType)'



;General procedure
; a) Welcome page (might be disabled later on)
; b) License is shown
; c) Readme is displayed


  

[Setup]
AppId=OSFontPack
SetupMutex=OSFontPack_Setup_Mutex 

AppName=Open Source Font Pack
AppVersion={#Version}
VersionInfoVersion={#Version}

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
#ifndef DEBUG
;Might be disabled later on
DisableWelcomePage=no
;License information
LicenseFile=licenses\license.txt
;readme
InfoBeforeFile=readme.md
#endif

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
#define i 0
#sub hack_files_out
  Source: "fonts\{#hack_sourcefolder}\{#hack_filenames[i]}.ttf"; DestDir: "{tmp}"; Flags: ignoreversion; Components: hack; AfterInstall: AddTempFontFile 
#endsub
#for {i = 0; i < DimOf(hack_filenames); i++} hack_files_out
#undef i


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
Filename: "{app}\InstallInfo.ini"; Section: "Main"; Key: "Version"; String: "{#Version}"

[UninstallDelete]
;Delete Install Info
Type: files; Name: "{app}\InstallInfo.ini"


[Code]
var
  //Contains the full filename (in Setup TEMP) for the fonts that are shpuld be installed
  FontFilesInTempFolder: array of string;
  FontFilesInTempFolder_HashValues: array of string;
  FontFilesInWindows_HashValue: array of string;


//Called for each font file extracted to {tmp}
procedure AddTempFontFile();
var
 fullFileName:string;
 arraySize:integer;
begin
  fullfilename:=ExpandConstant(CurrentFileName);
  log('Added file to TEMP list: ' + fullFileName);

  arraySize:=GetArrayLength(FontFilesInTempFolder);
  SetArrayLength(FontFilesInTempFolder, arraySize+1);

  //Arrays are zero based, so the first element is 0. Therefore just arraysize, not arraysize+1
  FontFilesInTempFolder[arraySize]:=fullFileName;   
end;


//Compare the files extracted to {tmp} to the font current font in {fonts}
//Since InnoSetup does not have support for TTF version check, we use SHA1 hashes for this
//NOTE: If a user has 
procedure CheckFontFiles();
var
 i:integer;
 curFontFile:string;
 curFontFileWindows:string;
begin
 log('CheckFontFiles() called...');

 //Resize the arrays so all of them have the same size
 SetArrayLength(FontFilesInTempFolder_HashValues, GetArrayLength(FontFilesInTempFolder));
 SetArrayLength(FontFilesInWindows_HashValue, GetArrayLength(FontFilesInTempFolder));

 for i := 0 to GetArrayLength(FontFilesInTempFolder)-1 do begin
     //Extract just the filename of the current font
     curFontFile:=ExtractFileName(FontFilesInTempFolder[i]);

     log('SHA1 hash check of '+curFontFile);
      
     //Store the hash of the file in TMP
     FontFilesInTempFolder_HashValues[i]:=GetSHA1OfFile(FontFilesInTempFolder[i]);
     log('   File from SETUP:  ' +  FontFilesInTempFolder_HashValues[i]);
     
     curFontFileWindows:=ExpandConstant('{fonts}\'+curFontFile);

     //Check the windows font folder for this entry and get the hash
     if FileExists(curFontFileWindows) then begin
        FontFilesInWindows_HashValue[i]:=GetSHA1OfFile(curFontFileWindows);
     end else begin
        FontFilesInWindows_HashValue[i]:='-NOT FOUND-';
     end;
     
     log('   File in FONTS  :  ' +  FontFilesInWindows_HashValue[i]);
 end;

 Sleep(2000);
end;





#expr SaveToFile(AddBackslash(SourcePath) + "zz_Temp_Preprocessed.iss")
