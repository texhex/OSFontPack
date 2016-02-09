; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS



; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS








; ISPP: Base Path C:\dev\git\OSFontPack\






















        















































;---DEBUG---
;Font file output
; Hack-Bold.ttf
; Hack-BoldItalic.ttf
; Hack-Regular.ttf
; Hack-Italic.ttf
; Roboto-Black.ttf
; Roboto-BlackItalic.ttf
; Roboto-Bold.ttf
; Roboto-BoldItalic.ttf
; Roboto-Italic.ttf
; Roboto-Light.ttf
; Roboto-LightItalic.ttf
; Roboto-Medium.ttf
; Roboto-MediumItalic.ttf
; Roboto-Regular.ttf
; Roboto-Thin.ttf
; Roboto-ThinItalic.ttf
; Lato-Black.ttf
; Lato-BlackItalic.ttf
; Lato-Bold.ttf
; Lato-BoldItalic.ttf
; Lato-Hairline.ttf
; Lato-HairlineItalic.ttf
; Lato-Heavy.ttf
; Lato-HeavyItalic.ttf
; Lato-Italic.ttf
; Lato-Light.ttf
; Lato-LightItalic.ttf
; Lato-Medium.ttf
; Lato-MediumItalic.ttf
; Lato-Regular.ttf
; Lato-Semibold.ttf
; Lato-SemiboldItalic.ttf
; Lato-Thin.ttf
; Lato-ThinItalic.ttf
; SourceSansPro-Black.ttf
; SourceSansPro-BlackIt.ttf
; SourceSansPro-Bold.ttf
; SourceSansPro-BoldIt.ttf
; SourceSansPro-ExtraLight.ttf
; SourceSansPro-ExtraLightIt.ttf
; SourceSansPro-It.ttf
; SourceSansPro-Light.ttf
; SourceSansPro-LightIt.ttf
; SourceSansPro-Regular.ttf
; SourceSansPro-Semibold.ttf
; SourceSansPro-SemiboldIt.ttf
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

AppName=Open Source Font Pack
AppVersion=1.0.2
VersionInfoVersion=1.0.2

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
SourceDir=C:\dev\git\OSFontPack\
OutputDir=out\
OutputBaseFilename=OSFontPack

;the file should be uninstallable
Uninstallable=Yes 

Compression=lzma2/ultra
SolidCompression=yes

PrivilegesRequired=admin

;Only include LicenseFile and InfoBeforeFile when using a release build
;Might be disabled later on
DisableWelcomePage=no
;License information
LicenseFile=licenses\license.txt
;readme
InfoBeforeFile=readme.md

;Ignore some screens
DisableDirPage=yes
DisableProgramGroupPage=yes
AllowCancelDuringInstall=False

[Types]
Name: "full"; Description: "Full: Install all fonts"
Name: "custom"; Description: "Custom: Select fonts to install"; Flags: iscustom

[Components]
Name: "hack"; Description: "Hack by Christopher Simpkins"; Types: full; Flags: disablenouninstallwarning;
Name: "lato"; Description: "Lato by Lukasz Dziedzic"; Types: full; Flags: disablenouninstallwarning;
Name: "roboto"; Description: "Roboto by Christian Robertson"; Types: full; Flags: disablenouninstallwarning;
Name: "sourcesans"; Description: "Source Sans Pro by Adobe Inc."; Types: full; Flags: disablenouninstallwarning;

[Icons]
Name: "{app}\Fonts Applet"; Filename: "control.exe"; Parameters: "/name Microsoft.Fonts"; WorkingDir: "{win}";

;The links to the homepage are only created if the user has selected the matching component
Name: "{app}\Hack by Christopher Simpkins"; Filename: "https://github.com/chrissimpkins/Hack"; Components: hack;
Name: "{app}\Roboto by Christian Robertson"; Filename: "https://github.com/google/roboto"; Components: roboto;
Name: "{app}\Lato by Lukasz Dziedzic"; Filename: "http://www.latofonts.com/"; Components: lato;
Name: "{app}\Source Sans Pro by Adobe Inc."; Filename: "https://github.com/adobe-fonts/source-sans-pro"; Components: sourcesans;




[Files]
;Copy license files - always copied
Source: "licenses/*.*"; DestDir: "{app}"; Flags: ignoreversion;

;Install fonts
  Source: "fonts\Hack_v2_019\Hack-Bold.ttf"; FontInstall: "Hack Bold"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Hack_v2_019\Hack-BoldItalic.ttf"; FontInstall: "Hack Bold Italic"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Hack_v2_019\Hack-Regular.ttf"; FontInstall: "Hack"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Hack_v2_019\Hack-Italic.ttf"; FontInstall: "Hack Italic"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Black.ttf"; FontInstall: "Roboto Black"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-BlackItalic.ttf"; FontInstall: "Roboto Black Italic"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Bold.ttf"; FontInstall: "Roboto Bold"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-BoldItalic.ttf"; FontInstall: "Roboto Bold Italic"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Italic.ttf"; FontInstall: "Roboto Italic"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Light.ttf"; FontInstall: "Roboto Light"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-LightItalic.ttf"; FontInstall: "Roboto Light Italic"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Medium.ttf"; FontInstall: "Roboto Medium"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-MediumItalic.ttf"; FontInstall: "Roboto Medium Italic"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Regular.ttf"; FontInstall: "Roboto"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Thin.ttf"; FontInstall: "Roboto Thin"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-ThinItalic.ttf"; FontInstall: "Roboto Thin Italic"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Black.ttf"; FontInstall: "Lato Black"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-BlackItalic.ttf"; FontInstall: "Lato Black Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Bold.ttf"; FontInstall: "Lato Bold"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-BoldItalic.ttf"; FontInstall: "Lato Bold Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Hairline.ttf"; FontInstall: "Lato Hairline"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-HairlineItalic.ttf"; FontInstall: "Lato Hairline Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Heavy.ttf"; FontInstall: "Lato Heavy"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-HeavyItalic.ttf"; FontInstall: "Lato Heavy Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Italic.ttf"; FontInstall: "Lato Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Light.ttf"; FontInstall: "Lato Light"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-LightItalic.ttf"; FontInstall: "Lato Light Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Medium.ttf"; FontInstall: "Lato Medium"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-MediumItalic.ttf"; FontInstall: "Lato Medium Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Regular.ttf"; FontInstall: "Lato"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Semibold.ttf"; FontInstall: "Lato Semibold"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-SemiboldItalic.ttf"; FontInstall: "Lato Semibold Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-Thin.ttf"; FontInstall: "Lato Thin"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\Lato_v2_015\Lato-ThinItalic.ttf"; FontInstall: "Lato Thin Italic"; Components: lato; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-Black.ttf"; FontInstall: "Source Sans Pro Black"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-BlackIt.ttf"; FontInstall: "Source Sans Pro Black Italic"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-Bold.ttf"; FontInstall: "Source Sans Pro Bold"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-BoldIt.ttf"; FontInstall: "Source Sans Pro Bold Italic"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-ExtraLight.ttf"; FontInstall: "Source Sans Pro ExtraLight"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-ExtraLightIt.ttf"; FontInstall: "Source Sans Pro ExtraLight Italic"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-It.ttf"; FontInstall: "Source Sans Pro Italic"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-Light.ttf"; FontInstall: "Source Sans Pro Light"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-LightIt.ttf"; FontInstall: "Source Sans Pro Light Italic"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-Regular.ttf"; FontInstall: "Source Sans Pro Regular"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-Semibold.ttf"; FontInstall: "Source Sans Pro Semibold"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 
  Source: "fonts\SourceSansPro_v2_020\SourceSansPro-SemiboldIt.ttf"; FontInstall: "Source Sans Pro Semibold Italic"; Components: sourcesans; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion restartreplace; 


[InstallDelete]
;If a user copies *.TTF files to the "Fonts" applet and a font file with the same name already exists, Windows will simply append "_0" (or _1) to the font file and copy it.
;These "ghost" files need to be exterminated!

;Helper macro to add something to a filename before the extension

  Type: files; Name: "{fonts}\Hack-Bold_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Hack-BoldItalic_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Hack-Regular_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Hack-Italic_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Roboto-Black_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-BlackItalic_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-Bold_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-BoldItalic_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-Italic_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-Light_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-LightItalic_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-Medium_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-MediumItalic_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-Regular_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-Thin_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Roboto-ThinItalic_*.ttf"; Components: roboto; 
  Type: files; Name: "{fonts}\Lato-Black_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-BlackItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Bold_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-BoldItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Hairline_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-HairlineItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Heavy_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-HeavyItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Italic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Light_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-LightItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Medium_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-MediumItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Regular_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Semibold_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-SemiboldItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-Thin_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\Lato-ThinItalic_*.ttf"; Components: lato; 
  Type: files; Name: "{fonts}\SourceSansPro-Black_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-BlackIt_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-Bold_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-BoldIt_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-ExtraLight_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-ExtraLightIt_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-It_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-Light_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-LightIt_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-Regular_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-Semibold_*.ttf"; Components: sourcesans; 
  Type: files; Name: "{fonts}\SourceSansPro-SemiboldIt_*.ttf"; Components: sourcesans; 

;Delete special files
;Hack: Version 2.10 has used "Oblique" instead of "Italic" so these files should be deleted when hack is selected
Type: files; Name: "{fonts}\Hack-BoldOblique.ttf"; Components: hack; 
Type: files; Name: "{fonts}\Hack-RegularOblique.ttf"; Components: hack; 



 
[INI]
;Create an ini to make detection for enterprise deployment tools easy
Filename: "{app}\InstallInfo.ini"; Section: "Main"; Key: "Version"; String: "1.0.2"

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
  customPrepareToInstall: TOutputProgressWizardPage;

  FontFiles: array of string;
  FontFilesComponents: array of string;
  FontFilesHashes: array of string;

  InstalledFontsHashes: array of string;

  FontCacheService_Stopped:boolean;
  FontCache30Service_Stopped:boolean;

  BeforeInstallActionWasRun:boolean;

  ChangesRequired:boolean;


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





procedure AddFontData(component, fontName, fontHash:string);
var
  curSize: integer;
begin
  curSize:=GetArrayLength(FontFiles);

  SetArrayLength(FontFiles, curSize+1)
  SetArrayLength(FontFilesComponents, curSize+1)
  SetArrayLength(FontFilesHashes, curSize+1)

  FontFiles[curSize]:=fontName;
  FontFilesComponents[curSize]:=component;
  FontFilesHashes[curSize]:=fontHash;
end;


procedure FillFontData();
begin



  AddFontData('hack', 'Hack-Bold.ttf', '88b4fa8e7d1aa8fe2d2d3f52a75cb2cf44b83c7a');
  AddFontData('hack', 'Hack-BoldItalic.ttf', 'a977e19b2b69c39eda63cd57fb41f55ef1fef38a');
  AddFontData('hack', 'Hack-Regular.ttf', '3d5f3ccfa40406ad252b76a2219cb629df8e5ab3');
  AddFontData('hack', 'Hack-Italic.ttf', '5d00974b49990e543f55b4aec2ea83660c8a49bf');
  AddFontData('roboto', 'Roboto-Black.ttf', '771b45f0ceb2a752cd0d705187468e6993fd0fb9');
  AddFontData('roboto', 'Roboto-BlackItalic.ttf', 'dfcf1003251caffcc9b94057d9845a5626b02fa3');
  AddFontData('roboto', 'Roboto-Bold.ttf', '0a1793926e2ee724cf2ff3fc7adc745348659f82');
  AddFontData('roboto', 'Roboto-BoldItalic.ttf', '23d74d6edc2cc6f0ae9e07e0094ebd3969e25b27');
  AddFontData('roboto', 'Roboto-Italic.ttf', '7703c7ab71c35f62289734f6b5431589008e700c');
  AddFontData('roboto', 'Roboto-Light.ttf', '2e3148d213b15328ebebba14e828fb3bf79634ee');
  AddFontData('roboto', 'Roboto-LightItalic.ttf', '947d4adbf4d1643a979972c83842899e752ee826');
  AddFontData('roboto', 'Roboto-Medium.ttf', '08bab5b1ab478e8af2279b613d3a32636b85cc65');
  AddFontData('roboto', 'Roboto-MediumItalic.ttf', '85304ad8ca294b9cefc65874d48a70a271635d28');
  AddFontData('roboto', 'Roboto-Regular.ttf', 'cb0cb91a31f43293bd7042ddab945ce161c29d3d');
  AddFontData('roboto', 'Roboto-Thin.ttf', '0fd03ae48dc48825c79b346fd981f55a01acf9e1');
  AddFontData('roboto', 'Roboto-ThinItalic.ttf', 'b61b6329c1b273fd662e638fb9cff02811d6d769');
  AddFontData('lato', 'Lato-Black.ttf', 'b9c952639741f5b7479e1ff6d1561a3df7e8f83a');
  AddFontData('lato', 'Lato-BlackItalic.ttf', '4bde1231ff7afccfdf4f77f086c0e9a93a4f3e46');
  AddFontData('lato', 'Lato-Bold.ttf', '6b2c7b124cbf0aaeba48d57fb0fa19f2c6c69683');
  AddFontData('lato', 'Lato-BoldItalic.ttf', 'bf9e7d4a6185b53a256272869e66762c1e5d503b');
  AddFontData('lato', 'Lato-Hairline.ttf', '79c1dd6a9c740ef36272a9742504864a6f912be7');
  AddFontData('lato', 'Lato-HairlineItalic.ttf', 'ea271649cc2f58a61fc819c9ca82eb8724717a2f');
  AddFontData('lato', 'Lato-Heavy.ttf', '068af974d1346b61d9ee1e097374f2f3cac6c442');
  AddFontData('lato', 'Lato-HeavyItalic.ttf', 'f2d4047e1f5efd405b850abe23ccfdc2ceb1b3f8');
  AddFontData('lato', 'Lato-Italic.ttf', '63c5d4424bc3466477be05dc122799df7665e571');
  AddFontData('lato', 'Lato-Light.ttf', 'a405c8288a8a90881407f93b6ee02b29e26a8735');
  AddFontData('lato', 'Lato-LightItalic.ttf', 'f05f3b58c5abd991036a1b43bd601556244ffe9e');
  AddFontData('lato', 'Lato-Medium.ttf', 'c78e94b7cc0b782eef4f9f2be371c3cf9c3f6eaf');
  AddFontData('lato', 'Lato-MediumItalic.ttf', 'df1a7160502d9e90c41b92b7243270a769904786');
  AddFontData('lato', 'Lato-Regular.ttf', 'f59f9e4f3cbee981a5e6f58a279f9b9613f22599');
  AddFontData('lato', 'Lato-Semibold.ttf', '96569e2cfcc3a298bb1aea21103d0d1e3c7e2ed4');
  AddFontData('lato', 'Lato-SemiboldItalic.ttf', '8a34fbb379a096d4c5914a962a6f71e1721b40a7');
  AddFontData('lato', 'Lato-Thin.ttf', 'dbe1f622faef3ea3f286d848da6b10f104405060');
  AddFontData('lato', 'Lato-ThinItalic.ttf', '8ce23025cf59e58b9bafdd8526d685d8347267c7');
  AddFontData('sourcesans', 'SourceSansPro-Black.ttf', '015bc7096ccfafc8807380b8ba38adb5563a08db');
  AddFontData('sourcesans', 'SourceSansPro-BlackIt.ttf', 'b0c53adf0f8330e918fb26e7f27cb7726d302ea1');
  AddFontData('sourcesans', 'SourceSansPro-Bold.ttf', 'fa8169be0d5370a134efa92a7db50b471ce2186c');
  AddFontData('sourcesans', 'SourceSansPro-BoldIt.ttf', '174b389d37802e155c114c518a678765fc0fa926');
  AddFontData('sourcesans', 'SourceSansPro-ExtraLight.ttf', 'ef807a40f0a039352d774980020527249ab99c67');
  AddFontData('sourcesans', 'SourceSansPro-ExtraLightIt.ttf', 'e64a18f95fec972b743f1cf5edc57a5dfc3ecab4');
  AddFontData('sourcesans', 'SourceSansPro-It.ttf', '1a79437400d5acb5dd2208190c588ff1f8beacf8');
  AddFontData('sourcesans', 'SourceSansPro-Light.ttf', 'eb597d3534ef7ff27cf9591812036865455369d3');
  AddFontData('sourcesans', 'SourceSansPro-LightIt.ttf', 'd7d0b76d6b16605826de5c6309b671fa713f13b0');
  AddFontData('sourcesans', 'SourceSansPro-Regular.ttf', '3b0910e841836a3f30a3ccfbd87bb6deed65f233');
  AddFontData('sourcesans', 'SourceSansPro-Semibold.ttf', '62ff33a5f7dc30693420b743f38af68e44b9d022');
  AddFontData('sourcesans', 'SourceSansPro-SemiboldIt.ttf', '769618686d0bd5a792db7a7c18e7c148f4b671e5');

end;


procedure InitializeWizard;
var
  title, subTitle:string;
begin
  ChangesRequired:=false;
  FontCacheService_Stopped:=false;
  FontCache30Service_Stopped:=false;

  BeforeInstallActionWasRun:=false;

  FillFontData;

  title:=SetupMessage(msgWizardPreparing);
  subTitle:=SetupMessage(msgPreparingDesc);
  
  StringChangeEx(subTitle, '[name]', 'Open Source Font Pack', True);
  customPrepareToInstall:=CreateOutputProgressPage(title, subTitle);
end;


function FontFilesFromSetupAndWindowsAreDifferent(component:string):boolean;
var
  i:integer;
begin
  result:=false;

  log('Checking for differences for component ' + component);

  for i := 0 to GetArrayLength(FontFiles)-1 do begin
      if FontFilesComponents[i]=component then begin
         if FontFilesHashes[i]<>InstalledFontsHashes[i] then begin
            
            log('  Found difference for file ' + FontFiles[i]);
            result:=true;
            
            break;
         end;       
      end;
  end;
end;

function FontFileInstallationRequired(): Boolean;
var
 file:string;
 i:integer;
 entryFound:boolean;
begin 
  if BeforeInstallActionWasRun=false then begin
     result:=true;
  end else begin 
     file:=ExtractFileName(CurrentFileName);
     log('FontFileInstallationRequired() called for ' + file);

     result:=false;
     entryFound:=false;
  
     for i := 0 to GetArrayLength(FontFiles)-1 do begin
         if FontFiles[i]=file then begin         
            entryFound:=true;  
            if FontFilesHashes[i]<>InstalledFontsHashes[i] then begin
               log('  Hash values: ' + FontFilesHashes[i] + ' / ' + InstalledFontsHashes[i]);
               result:=true;
            end else begin
               log('  No intallation required, same file');
            end;

            break;
         end;
     end;

     if entryFound=false then begin
        RaiseException('No entry in the internal hash arrays found for: ' + file);
     end; 


  end;
 
end;



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

     customPrepareToInstall.SetText('Calculating hashes for fonts already installed...', '');
     
     SetArrayLength(InstalledFontsHashes, GetArrayLength(FontFiles));
     
     for i := 0 to GetArrayLength(FontFiles)-1 do begin
         currentFont:=FontFiles[i];
         log('Calculating hash for '+currentFont);
         log('   File from setup: ' +  FontFilesHashes[i]);    
         
         currentFontFileNameWindows:=ExpandConstant('{fonts}\'+currentFont);
    
         if FileExists(currentFontFileNameWindows) then begin
            InstalledFontsHashes[i]:=GetSHA1OfFile(currentFontFileNameWindows);
         end else begin
            InstalledFontsHashes[i]:='-NOT FOUND-';
         end;
     
         log('   File in \fonts : ' +  InstalledFontsHashes[i]);
     end;

     ChangesRequired:=false;

     if IsComponentSelected('hack') then begin        
        if FontFilesFromSetupAndWindowsAreDifferent('hack') then begin
           ChangesRequired:=true;
        end;

     end;


     if IsComponentSelected('roboto') then begin        
        if FontFilesFromSetupAndWindowsAreDifferent('roboto') then begin
           ChangesRequired:=true;
        end;
     end;


     if IsComponentSelected('lato') then begin        
        if FontFilesFromSetupAndWindowsAreDifferent('lato') then begin
           ChangesRequired:=true;
        end;
     end;

     if IsComponentSelected('sourcesans') then begin        
        if FontFilesFromSetupAndWindowsAreDifferent('sourcesans') then begin
           ChangesRequired:=true;
        end;
     end;



     FontCacheService_Stopped:=false;
     FontCache30Service_Stopped:=false;

     if ChangesRequired=true then begin

        customPrepareToInstall.SetText('Stopping service FontCache...','');
        FontCacheService_Stopped:=StopNTService2('FontCache');

        customPrepareToInstall.SetText('Stopping service FontCache3.0.0.0...','');
        FontCache30Service_Stopped:=StopNTService2('FontCache3.0.0.0')
     end;



    
  end;
  finally
    customPrepareToInstall.Hide;
  end;

  BeforeInstallActionWasRun:=true;
  log('---BeforeInstallAction END---');
end;



procedure AfterInstallAction();
begin
  log('---AfterInstallAction---');

  customPrepareToInstall.SetProgress(0, 0);
  customPrepareToInstall.Show;

  try
    begin

      customPrepareToInstall.SetText('Starting service FontCache...','');
      if FontCacheService_Stopped=true then begin
         StartNTService2('FontCache');
         FontCacheService_Stopped:=false;
      end;

      customPrepareToInstall.SetText('Starting service FontCache3.0.0.0...','');
      if FontCache30Service_Stopped=true then begin
         StartNTService2('FontCache3.0.0.0');         
         FontCache30Service_Stopped:=false;
      end;


      SendBroadcastMessage(29, 0, 0);

   
  end;
  finally
    customPrepareToInstall.Hide;
  end;

  log('---AfterInstallAction END---');
end;



function NeedRestart(): Boolean;
begin
 
  log('---NeedRestart---');
  if ChangesRequired then
     log('  Changes detected, require reboot');

  result:=ChangesRequired;
    
  log('---NeedRestart END---');
end;

function UninstallNeedRestart(): Boolean;
begin
 result:=true;
end;


procedure CurStepChanged(CurStep: TSetupStep);
begin
 
 if CurStep=ssInstall then begin
    BeforeInstallAction();
 end;

 if CurStep=ssPostInstall then begin
    AfterInstallAction(); 
 end;

end;





