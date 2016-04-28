//OSFontPack
//Copyright © 2016 Michael 'Tex' Hex 
//Licensed under the MIT License
//https://github.com/texhex/OSFontPack/

//We require InnoSetup 5.5.8
#if VER < EncodeVer(5,5,8)
  #error A more recent version of Inno Setup is required to compile this script (5.5.8 or newer)
#endif

#include <ISPPBuiltins.iss>
#pragma option -v+
#pragma verboselevel 9



//Disable the following line when releasing the setup
//#define DEBUG

//Update this when releasing a new version
#define public Version '1.3.0'



//--------------------------------------------------------------------
//Get the base path of this setup. It is assumed that is located in a folder named "src" and the base path is the folder above it
#define base_path StringChange(SourcePath,'src\','') 
#emit '; ISPP: Base Path ' + base_path

//Name of this setup
#define public AppName 'Open Source Font Pack'

//Internal names of the services 
#define public FontCacheService 'FontCache'
#define public FontCache30Service 'FontCache3.0.0.0'




//Total number of font entries we have
#define total_fonts 52
//--------------------------


#dim public font_component[total_fonts]
#dim public font_source[total_fonts]
#dim public font_file[total_fonts]
#dim public font_name[total_fonts]

//Counter for array
#define cntr 0


//Definition for Hack Font
#define hack_component 'hack'
#define hack_sourcefolder 'Hack_v2_020'
#define hack_description 'Hack by Christopher Simpkins'
#define hack_homepage 'https://github.com/chrissimpkins/Hack'


#define font_component[cntr] hack_component
#define font_source[cntr] hack_sourcefolder
#define font_file[cntr] 'Hack-Bold.ttf'
#define font_name[cntr] 'Hack Bold'
#define cntr cntr+1

#define font_component[cntr] hack_component
#define font_source[cntr] hack_sourcefolder
#define font_file[cntr] 'Hack-BoldItalic.ttf'
#define font_name[cntr] 'Hack Bold Italic'
#define cntr cntr+1

#define font_component[cntr] hack_component
#define font_source[cntr] hack_sourcefolder
#define font_file[cntr] 'Hack-Regular.ttf'
#define font_name[cntr] 'Hack' /*Regular is not used by Windows, so we need to remove this from the font name*/
#define cntr cntr+1

#define font_component[cntr] hack_component
#define font_source[cntr] hack_sourcefolder
#define font_file[cntr] 'Hack-Italic.ttf'
#define font_name[cntr] 'Hack Italic'
#define cntr cntr+1


//Definition for Roboto Font
#define public roboto_component 'roboto'
#define public roboto_sourcefolder 'Roboto_v2_132_unhinted'
#define roboto_description 'Roboto by Christian Robertson'
#define roboto_homepage 'https://github.com/google/roboto'


#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-Black.ttf'
#define font_name[cntr] 'Roboto Black'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder        
#define font_file[cntr] 'Roboto-BlackItalic.ttf'
#define font_name[cntr] 'Roboto Black Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder        
#define font_file[cntr] 'Roboto-Bold.ttf'
#define font_name[cntr] 'Roboto Bold'
#define cntr cntr+1
        
#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-BoldItalic.ttf'
#define font_name[cntr] 'Roboto Bold Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder       
#define font_file[cntr] 'Roboto-Italic.ttf'
#define font_name[cntr] 'Roboto Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder       
#define font_file[cntr] 'Roboto-Light.ttf'
#define font_name[cntr] 'Roboto Light'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-LightItalic.ttf'
#define font_name[cntr] 'Roboto Light Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-Medium.ttf'
#define font_name[cntr] 'Roboto Medium'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-MediumItalic.ttf'
#define font_name[cntr] 'Roboto Medium Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-Regular.ttf'
#define font_name[cntr] 'Roboto'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-Thin.ttf'
#define font_name[cntr] 'Roboto Thin'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'Roboto-ThinItalic.ttf'
#define font_name[cntr] 'Roboto Thin Italic'
#define cntr cntr+1

//   Roboto Condensed
#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'RobotoCondensed-Regular.ttf'
#define font_name[cntr] 'Roboto Condensed' /*Regular is not used by Windows, so we need to remove this from the font name*/
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'RobotoCondensed-Bold.ttf'
#define font_name[cntr] 'Roboto Condensed Bold'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'RobotoCondensed-BoldItalic.ttf'
#define font_name[cntr] 'Roboto Condensed Bold Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'RobotoCondensed-Italic.ttf'
#define font_name[cntr] 'Roboto Condensed Italic'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'RobotoCondensed-Light.ttf'
#define font_name[cntr] 'Roboto Condensed Light'
#define cntr cntr+1

#define font_component[cntr] roboto_component
#define font_source[cntr] roboto_sourcefolder
#define font_file[cntr] 'RobotoCondensed-LightItalic.ttf'
#define font_name[cntr] 'Roboto Condensed Light Italic'
#define cntr cntr+1


//Definition for Lato
#define public lato_component 'lato'
#define public lato_sourcefolder 'Lato_v2_015'
#define public lato_description 'Lato by Lukasz Dziedzic'
#define public lato_homepage 'http://www.latofonts.com/'


#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Black.ttf'
#define font_name[cntr] 'Lato Black'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-BlackItalic.ttf'
#define font_name[cntr] 'Lato Black Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Bold.ttf'
#define font_name[cntr] 'Lato Bold'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-BoldItalic.ttf'
#define font_name[cntr] 'Lato Bold Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Hairline.ttf'
#define font_name[cntr] 'Lato Hairline'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-HairlineItalic.ttf'
#define font_name[cntr] 'Lato Hairline Italic'   
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Heavy.ttf'
#define font_name[cntr] 'Lato Heavy'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-HeavyItalic.ttf'
#define font_name[cntr] 'Lato Heavy Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Italic.ttf'
#define font_name[cntr] 'Lato Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Light.ttf'
#define font_name[cntr] 'Lato Light'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-LightItalic.ttf'
#define font_name[cntr] 'Lato Light Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Medium.ttf'
#define font_name[cntr] 'Lato Medium'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-MediumItalic.ttf'
#define font_name[cntr] 'Lato Medium Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Regular.ttf'
#define font_name[cntr] 'Lato'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Semibold.ttf'
#define font_name[cntr] 'Lato Semibold'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-SemiboldItalic.ttf'
#define font_name[cntr] 'Lato Semibold Italic'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-Thin.ttf'
#define font_name[cntr] 'Lato Thin'
#define cntr cntr+1

#define font_component[cntr] lato_component
#define font_source[cntr] lato_sourcefolder
#define font_file[cntr] 'Lato-ThinItalic.ttf'
#define font_name[cntr] 'Lato Thin Italic'
#define cntr cntr+1


//Definition for Source Sans Pro
#define public sourcesans_component 'sourcesans'
#define public sourcesans_sourcefolder 'SourceSansPro_v2_020'
#define public sourcesans_description 'Source Sans Pro by Adobe Inc.'
#define public sourcesans_homepage 'https://github.com/adobe-fonts/source-sans-pro'


#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-Black.ttf'
#define font_name[cntr] 'Source Sans Pro Black'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-BlackIt.ttf'
#define font_name[cntr] 'Source Sans Pro Black Italic'
#define cntr cntr+1


#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-Bold.ttf'
#define font_name[cntr] 'Source Sans Pro Bold'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-BoldIt.ttf'
#define font_name[cntr] 'Source Sans Pro Bold Italic'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-ExtraLight.ttf'
#define font_name[cntr] 'Source Sans Pro ExtraLight'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-ExtraLightIt.ttf'
#define font_name[cntr] 'Source Sans Pro ExtraLight Italic'                         
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-It.ttf'
#define font_name[cntr] 'Source Sans Pro Italic'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-Light.ttf'
#define font_name[cntr] 'Source Sans Pro Light'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-LightIt.ttf'
#define font_name[cntr] 'Source Sans Pro Light Italic'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-Regular.ttf'
#define font_name[cntr] 'Source Sans Pro Regular'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-Semibold.ttf'
#define font_name[cntr] 'Source Sans Pro Semibold'
#define cntr cntr+1

#define font_component[cntr] sourcesans_component
#define font_source[cntr] sourcesans_sourcefolder
#define font_file[cntr] 'SourceSansPro-SemiboldIt.ttf'
#define font_name[cntr] 'Source Sans Pro Semibold Italic'
#define cntr cntr+1

//---------------------------------------------------------

//Helper macro to generate a SHA1 hash for a font file
#define public GetSHA1OfFontFile(str fontFolder, str fontFile) \
  GetSHA1OfFile(base_path + 'fonts\' + fontFolder + '\' + fontFile)

;---DEBUG---
;This output ensures that we do not have font_xxx array elements that are empty.
#define public GetFontDataDebugOutput(str component, str source, str fileName, str fontName) \
   component + ': ' + source + '\' + fileName + ' - "' + fontName + '"'

;Because the sub expects a string for each item, an error from ISPP about "Actual datatype not declared type" 
;when compiling the setup indicates that total_fonts is set to a wrong value
  
#define public i 0
#sub Sub_DebugFontDataOutput
  #emit '; ' + GetFontDataDebugOutput(font_component[i], font_source[i], font_file[i], font_name[i]) + ' (' + GetSHA1OfFontFile(font_source[i], font_file[i]) + ')'
#endsub
#for {i = 0; i < DimOf(font_file); i++} Sub_DebugFontDataOutput
#undef i

;---END---



;General procedure
; a) Welcome page (Needed to display the version of this setup)
; b) License is shown
; c) Readme is displayed
; d) Select fonts to install 
; e) Ready to install
; d) INSTALL
; d1) InstallDelete
; d2) BeforeInstallAction (Stop services)
; d3) Install files
; d4) AfterInstallAction (Start services)
; e) All done


  

[Setup]
AppId=OSFontPack
SetupMutex=OSFontPack_Setup_Mutex 

AppName={#AppName}
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
SourceDir={#base_path}
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
Name: "{#hack_component}"; Description: "{#hack_description}"; Types: full; Flags: disablenouninstallwarning;
Name: "{#lato_component}"; Description: "{#lato_description}"; Types: full; Flags: disablenouninstallwarning;
Name: "{#roboto_component}"; Description: "{#roboto_description}"; Types: full; Flags: disablenouninstallwarning;
Name: "{#sourcesans_component}"; Description: "{#sourcesans_description}"; Types: full; Flags: disablenouninstallwarning;

[Icons]
Name: "{app}\Fonts Applet"; Filename: "control.exe"; Parameters: "/name Microsoft.Fonts"; WorkingDir: "{win}";

;The links to the homepage are only created if the user has selected the matching component
Name: "{app}\{#hack_description}"; Filename: "{#hack_homepage}"; Components: {#hack_component};
Name: "{app}\{#roboto_description}"; Filename: "{#roboto_homepage}"; Components: {#roboto_component};
Name: "{app}\{#lato_description}"; Filename: "{#lato_homepage}"; Components: {#lato_component};
Name: "{app}\{#sourcesans_description}"; Filename: "{#sourcesans_homepage}"; Components: {#sourcesans_component};




[Files]
;Copy license files - always copied
Source: "licenses/*.*"; DestDir: "{app}"; Flags: ignoreversion;

;Install fonts
#define public i 0
#sub Sub_FontInstall
  Source: "fonts\{#font_source[i]}\{#font_file[i]}"; FontInstall: "{#font_name[i]}"; Components: {#font_component[i]}; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
#endsub
#for {i = 0; i < DimOf(font_file); i++} Sub_FontInstall
#undef i


[InstallDelete]
;If a user copies *.TTF files to the "Fonts" applet and a font file with the same name already exists, Windows will simply append "_0" (or _1) to the font file and copy it.
;These "ghost" files need to be exterminated!

;Helper macro to add something to a filename before the extension
#define public AddStringToEndOfFilename(str fileName, str whatToAdd) \
  StringChange(fileName, '.'+ExtractFileExt(filename), whatToAdd + '.' + ExtractFileExt(fileName))

#define public i 0
#sub Sub_InstallDeleteRemove
  Type: files; Name: "{fonts}\{#AddStringToEndOfFilename(font_file[i], '_*')}"; Components: {#font_component[i]}; 
#endsub
#for {i = 0; i < DimOf(font_file); i++} Sub_InstallDeleteRemove
#undef i

;Delete special files
;Hack: Version 2.10 has used "Oblique" instead of "Italic" so these files should be deleted when hack is selected
Type: files; Name: "{fonts}\Hack-BoldOblique.ttf"; Components: {#hack_component}; 
Type: files; Name: "{fonts}\Hack-RegularOblique.ttf"; Components: {#hack_component}; 



 
[INI]
;Create an ini to make detection for enterprise deployment tools easy
Filename: "{app}\InstallInfo.ini"; Section: "Main"; Key: "Version"; String: "{#Version}"

[UninstallDelete]
;Delete Install Info
Type: files; Name: "{app}\InstallInfo.ini"






[Code]
type
	SERVICE_STATUS = record
    	dwServiceType				: cardinal;
    	dwCurrentState				: cardinal;
    	dwControlsAccepted			: cardinal;
    	dwWin32ExitCode				: cardinal;
    	dwServiceSpecificExitCode	: cardinal;
    	dwCheckPoint				: cardinal;
    	dwWaitHint					: cardinal;
	end;
	HANDLE = cardinal;

const
	SERVICE_QUERY_CONFIG		= $1;
	SERVICE_CHANGE_CONFIG		= $2;
	SERVICE_QUERY_STATUS		= $4;
	SERVICE_START				= $10;
	SERVICE_STOP				= $20;
	SERVICE_ALL_ACCESS			= $f01ff;
	SC_MANAGER_ALL_ACCESS		= $f003f;
	SERVICE_WIN32_OWN_PROCESS	= $10;
	SERVICE_WIN32_SHARE_PROCESS	= $20;
	SERVICE_WIN32				= $30;
	SERVICE_INTERACTIVE_PROCESS = $100;
	SERVICE_BOOT_START          = $0;
	SERVICE_SYSTEM_START        = $1;
	SERVICE_AUTO_START          = $2;
	SERVICE_DEMAND_START        = $3;
	SERVICE_DISABLED            = $4;
	SERVICE_DELETE              = $10000;
	SERVICE_CONTROL_STOP		= $1;
	SERVICE_CONTROL_PAUSE		= $2;
	SERVICE_CONTROL_CONTINUE	= $3;
	SERVICE_CONTROL_INTERROGATE = $4;
	SERVICE_STOPPED				= $1;
	SERVICE_START_PENDING       = $2;
	SERVICE_STOP_PENDING        = $3;
	SERVICE_RUNNING             = $4;
	SERVICE_CONTINUE_PENDING    = $5;
	SERVICE_PAUSE_PENDING       = $6;
	SERVICE_PAUSED              = $7;

  
var
  //Custom "prepare to install" page
  customPrepareToInstall: TOutputProgressWizardPage;

  //All font files included in this setup
  FontFiles: array of string;
  //To which component these files belong to
  FontFilesComponents: array of string;
  //SHA1 hashes for these files
  FontFilesHashes: array of string;
  //Font names for these files
  FontFilesNames: array of string;
  
  //SHA1 hashes for fonts already installed
  InstalledFontsHashes: array of string;

  //True if we have stopped FontCache service
  FontCacheService_Stopped:boolean;
  FontCache30Service_Stopped:boolean;

  //True if the action has been run
  BeforeInstallActionWasRun:boolean;

  //If this true we will make changes to this system
  ChangesRequired:boolean;


// #######################################################################################
// Service control code  from http://www.vincenzo.net/isxkb/index.php?title=Service_-_Functions_to_Start%2C_Stop%2C_Install%2C_Remove_a_Service
function OpenSCManager(lpMachineName, lpDatabaseName: string; dwDesiredAccess :cardinal): HANDLE;
external 'OpenSCManagerA@advapi32.dll stdcall';

function OpenService(hSCManager :HANDLE;lpServiceName: string; dwDesiredAccess :cardinal): HANDLE;
external 'OpenServiceA@advapi32.dll stdcall';

function CloseServiceHandle(hSCObject :HANDLE): boolean;
external 'CloseServiceHandle@advapi32.dll stdcall';

function StartNTService(hService :HANDLE;dwNumServiceArgs : cardinal;lpServiceArgVectors : cardinal) : boolean;
external 'StartServiceA@advapi32.dll stdcall';

function ControlService(hService :HANDLE; dwControl :cardinal;var ServiceStatus :SERVICE_STATUS) : boolean;
external 'ControlService@advapi32.dll stdcall';

function QueryServiceStatus(hService :HANDLE;var ServiceStatus :SERVICE_STATUS) : boolean;
external 'QueryServiceStatus@advapi32.dll stdcall';

function OpenServiceManager() : HANDLE;
begin
	if UsingWinNT() = true then begin
		Result := OpenSCManager('','ServicesActive',SC_MANAGER_ALL_ACCESS);
		if Result = 0 then
			MsgBox('the servicemanager is not available', mbError, MB_OK)
	end
	else begin
			MsgBox('only nt based systems support services', mbError, MB_OK)
			Result := 0;
	end
end;

function IsServiceInstalled(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_QUERY_CONFIG);
        if hService <> 0 then begin
            Result := true;
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end
end;



function StartService(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_START);
        if hService <> 0 then begin
        	Result := StartNTService(hService,0,0);
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end;
end;

function StopService(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
	Status	: SERVICE_STATUS;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_STOP);
        if hService <> 0 then begin
        	Result := ControlService(hService,SERVICE_CONTROL_STOP,Status);
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end;
end;

function IsServiceRunning(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
	Status	: SERVICE_STATUS;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_QUERY_STATUS);
    	if hService <> 0 then begin
			if QueryServiceStatus(hService,Status) then begin
				Result :=(Status.dwCurrentState = SERVICE_RUNNING)
        	end;
            CloseServiceHandle(hService)
		    end;
        CloseServiceHandle(hSCM)
	end
end;

// #######################################################################################




//Adds font data (created at setup creation) to the runtime Font* arrays
procedure AddFontData(component, fontFile, fontName, fontHash :string);
var
  curSize: integer;
begin
  curSize:=GetArrayLength(FontFiles);

  SetArrayLength(FontFiles, curSize+1)
  SetArrayLength(FontFilesComponents, curSize+1)
  SetArrayLength(FontFilesHashes, curSize+1)
  SetArrayLength(FontFilesNames, curSize+1)
  

  FontFiles[curSize]:=fontFile;
  FontFilesComponents[curSize]:=component;
  FontFilesHashes[curSize]:=fontHash;
  FontFilesNames[curSize]:=fontName;
end;


//Prepare FontFiles and FontFilesHashes arrays
procedure FillFontData();
begin

//Helper macro to generate a pascal script function call with the font filename and the SHA1 hash 
#define public AddFontDataMacro(str fileName, str component, strFontName, str SHA1Hash) \
  '  AddFontData(''' + component + '''' + ', ''' + fileName + ''', ''' + strFontName + ''', ''' + SHA1Hash + ''');'



//Generate AddFontData(....) calls
#define public i 0  
#sub Sub_FontDataGenerateHash
 #emit  AddFontDataMacro(font_file[i], font_component[i], font_name[i], GetSHA1OfFontFile(font_source[i], font_file[i])) 
#endsub
#for {i = 0; i < DimOf(font_file); i++} Sub_FontDataGenerateHash
#undef public i

end;


procedure InitializeWizard;
var
  title, subTitle:string;
begin
  ChangesRequired:=false;
  FontCacheService_Stopped:=false;
  FontCache30Service_Stopped:=false;

  BeforeInstallActionWasRun:=false;

  //Fill font data arrays
  FillFontData;

  //Prepare the custom PrepareToInstall wizard page
  title:=SetupMessage(msgWizardPreparing);
  subTitle:=SetupMessage(msgPreparingDesc);
  
  //subTitle contains [name] which we need to replace 
  StringChangeEx(subTitle, '[name]', '{#AppName}', True);
  customPrepareToInstall:=CreateOutputProgressPage(title, subTitle);
end;



//This function returns TRUE if:
// - the SHA1 hash of a file inside Windows\fonts is the same as the hash we have calculated
// - the name in the registry is the same we would use and it points to the same file
function IsSetupFontSameAsInstalledFont(fileName:string):boolean;
var
  i:integer;
  entryFound:boolean;
  registryFontValue:string;
begin
  log('IsSetupFontSameAsInstalledFont(): ' + fileName);

  result:=false;
  entryFound:=false;
  
  for i := 0 to GetArrayLength(FontFiles)-1 do begin

      //Check SHA1 hash from setup and Windows
      if FontFiles[i]=fileName then begin         
         entryFound:=true;                  

         if FontFilesHashes[i]=InstalledFontsHashes[i] then begin                 
            //Now check if the font registration info in the registry also matches
            if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts', FontFilesNames[i]+' (TrueType)', registryFontValue) then begin               
               //Does the value point to the same file as we have in setup?
               if registryFontValue=fileName then begin                  
                  result:=true; //all is exactly as expected
               end else begin
                  log('   File name in registry is different, installation required');                  
               end;            
            end else begin
               log('   Font not found in registry, installation required');
            end;
         end else begin
            log('   Hash values (Setup/Windows): ' + FontFilesHashes[i] + ' / ' + InstalledFontsHashes[i]);
            log('   File is different, installation required');
         end;

      end;   

   end;

   //Sanity check
   if entryFound=false then begin
      RaiseException('No entry in the internal hash arrays found for: ' + fileName);
   end; 

end;



//Returns TRUE if a difference between the fonts in component from setup and the already installed fonts
function ComponentRequiresInstallation(component:string):boolean;
var
  i:integer;
begin
  result:=false;

  log('Checking for differences for component ' + component);

  for i := 0 to GetArrayLength(FontFiles)-1 do begin
      if FontFilesComponents[i]=component then begin
         
         if IsSetupFontSameAsInstalledFont(FontFiles[i]) then begin
            //File is the same, ignore
         end else begin
            //Here we have a change, installation is required!
            log('   Found difference for file ' + FontFiles[i]);
            log('   Component requires installation: ' + component);

            //One detected difference is enough to result TRUE
            result:=true;           
            break;
         end;
    
      end;
  end;
end;


//Called for each font that should be installed
//InnoSetup might call this function BEFORE our BeforeInstallAction is run. If this happens, we will always return TRUE
function FontFileInstallationRequired(): Boolean;
var
 file:string;
begin 

  if BeforeInstallActionWasRun=false then begin
     result:=true;
  end else begin 
     //This is the "real" thing once BeforeInstallAction was run
     file:=ExtractFileName(CurrentFileName);

     if IsSetupFontSameAsInstalledFont(file) then begin
        result:=false; //No installation required
     end else begin
        result:=true; //Installation required
     end;
  end;
 
end;



//Returns TRUE if a service was started 
function StartNTService2(serviceName:string):boolean;
begin
   if IsServiceInstalled(serviceName) then begin
      if IsServiceRunning(serviceName)=false then begin
         log('Starting service ' + serviceName);
         StartService(serviceName);
         sleep(1500); //give the service some seconds
         result:=true;
      end; 
   end;
end;

//Stops a service and returns TRUE if it was stopped
function StopNTService2(serviceName:string):boolean;
begin
   if IsServiceInstalled(serviceName) then begin
      if IsServiceRunning(serviceName) then begin
         log('Stopping service ' + serviceName);
         StopService(serviceName);
         sleep(1500);
         result:=true;
      end; 
   end;
end;


//Show a custom prepare to install page in order to give the user output what we are doing
procedure BeforeInstallAction();
var
  i:integer;
  currentFont:string;
  currentFontFileNameWindows:string;
 
begin
  log('---BeforeInstallAction---');

  customPrepareToInstall.SetProgress(0, 0);
  customPrepareToInstall.Show;

  try
    begin

     //Calculate the SHA1 hash for *ALL* fonts we support
     customPrepareToInstall.SetText('Calculating hashes for fonts already installed...', '');
     
     SetArrayLength(InstalledFontsHashes, GetArrayLength(FontFiles));
     
     log('---HASH CALCULATION---');
     for i := 0 to GetArrayLength(FontFiles)-1 do begin
         currentFont:=FontFiles[i];
         log('Calculating hash for '+currentFont);
         log('   File from setup: ' +  FontFilesHashes[i]);    
         
         currentFontFileNameWindows:=ExpandConstant('{fonts}\'+currentFont);
    
         //Check the windows font folder for this entry and get the hash
         if FileExists(currentFontFileNameWindows) then begin
            InstalledFontsHashes[i]:=GetSHA1OfFile(currentFontFileNameWindows);
         end else begin
            InstalledFontsHashes[i]:='-NOT FOUND-';
         end;
     
         log('   File in \fonts : ' +  InstalledFontsHashes[i]);
     end;
     log('----------------------');
     
     
     //Set it to false by default
     ChangesRequired:=false;


     //Now we need to know which components the user has selected and check if we have differences
     //This step is necessary in order to make sure we do not start/stop services for files this setup included, 
     //but the user does not want to install it. In this case, the difference can be ignored.
     if IsComponentSelected('{#hack_component}') then begin        
        //if FontFilesFromSetupAndWindowsAreDifferent('{#hack_component}') then begin
        if ComponentRequiresInstallation('{#hack_component}') then begin
           ChangesRequired:=true;
        end;

        //Delete the left over entry from Hack v2.10
        //RegDeleteValue(HKLM, 'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts', 'Hack Oblique Regular (TrueType)');
     end;


     if IsComponentSelected('{#roboto_component}') then begin        
        if ComponentRequiresInstallation('{#roboto_component}') then begin
           ChangesRequired:=true;
        end;
     end;


     if IsComponentSelected('{#lato_component}') then begin        
        if ComponentRequiresInstallation('{#lato_component}') then begin
           ChangesRequired:=true;
        end;
     end;

     if IsComponentSelected('{#sourcesans_component}') then begin        
        if ComponentRequiresInstallation('{#sourcesans_component}') then begin
           ChangesRequired:=true;
        end;
     end;



     //If at least one file will be installed, we will stop the "Windows Font Cache Service" and the "Windows Presentation Foundation Font Cache".
     //This will ensure that that these services update their internal database
     //If users still report about broken fonts, we will need to delete FontCache-S*.dat and ~FontCache-S*.dat from  C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache 
     FontCacheService_Stopped:=false;
     FontCache30Service_Stopped:=false;

     if ChangesRequired=true then begin

        customPrepareToInstall.SetText('Stopping service {#FontCacheService}...','');
        FontCacheService_Stopped:=StopNTService2('{#FontCacheService}');

        customPrepareToInstall.SetText('Stopping service {#FontCache30Service}...','');
        FontCache30Service_Stopped:=StopNTService2('{#FontCache30Service}')
     end;



    
  end;
  finally
    customPrepareToInstall.Hide;
  end;

  BeforeInstallActionWasRun:=true;
  log('---BeforeInstallAction END---');
end;



//Show a custom prepare to install page in order to give the user output what we are doing
procedure AfterInstallAction();
begin
  log('---AfterInstallAction---');

  customPrepareToInstall.SetProgress(0, 0);
  customPrepareToInstall.Show;

  try
    begin

      //Start the service the before action has stopped
      customPrepareToInstall.SetText('Starting service {#FontCacheService}...','');
      if FontCacheService_Stopped=true then begin
         StartNTService2('{#FontCacheService}');
         FontCacheService_Stopped:=false;
      end;

      customPrepareToInstall.SetText('Starting service {#FontCache30Service}...','');
      if FontCache30Service_Stopped=true then begin
         StartNTService2('{#FontCache30Service}');         
         FontCache30Service_Stopped:=false;
      end;


      //Finally, inform windows that fonts have changed (just to be sure we do this always)
      //See https://msdn.microsoft.com/en-us/library/windows/desktop/dd183326%28v=vs.85%29.aspx
      SendBroadcastMessage(29, 0, 0);
      //HWND_BROADCAST = -1
      //WM_FONTCHANGE = 0x1D = 29

   
  end;
  finally
    customPrepareToInstall.Hide;
  end;

  log('---AfterInstallAction END---');
end;



function NeedRestart(): Boolean;
begin
  //Given the MSDN docs, it seems that changing the fonts always requires a restart: https://msdn.microsoft.com/en-us/library/windows/desktop/dd183326%28v=vs.85%29.aspx
  //I also noticed this during the development of this setup, so we better be sure than sorry. 
 
  log('---NeedRestart---');
  if ChangesRequired then
     log('  Changes detected, require reboot');

  result:=ChangesRequired;
    
  log('---NeedRestart END---');
end;

function UninstallNeedRestart(): Boolean;
begin
 //See comments above, we better always request a restart
 result:=true;
end;


//Set up our own actions before and after the install starts
procedure CurStepChanged(CurStep: TSetupStep);
begin
 
 if CurStep=ssInstall then begin
    //I'm aware of the fact that I would also simply display this page by using the PrepareToInstall() function.
    //But I wanted to have both Before* and After* procedures listed here
    BeforeInstallAction();
 end;

 if CurStep=ssPostInstall then begin
    AfterInstallAction(); 
 end;

end;





#expr SaveToFile(AddBackslash(SourcePath) + "OSFontPack_Setup_TEMP_Preprocessed.iss")
