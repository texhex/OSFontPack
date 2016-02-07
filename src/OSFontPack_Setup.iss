//OSFontPack
//Copyright © 2016 Michael 'Tex' Hex 
//Licensed under the MIT License
//https://github.com/texhex/OSFontPack/

#include <ISPPBuiltins.iss>
#pragma option -v+
#pragma verboselevel 9

//We require InnoSetup 5.5.8
#if VER < EncodeVer(5,5,8)
  #error A more recent version of Inno Setup is required to compile this script (5.5.8 or newer)
#endif


//Disable the following line when releasing the setup
//#define DEBUG

//Update this when releasing a new version
#define public Version '0.4.1'


//--------------------------------------------------------------------
//Get the base path of this setup. It is assumed that is located in a folder named "src" and the base path is the folder above it
#define base_path StringChange(SourcePath,'src\','') 
#emit '; ISPP: Base Path ' + base_path

//Name of this setup
#define public AppName 'Open Source Font Pack'

//Internal names of the services 
#define public FontCacheService 'FontCache'
#define public FontCache30Service 'FontCache3.0.0.0'



//Definition for Hack Font
#define hack_component 'hack'
#define hack_description 'Hack by Christopher Simpkins'
#define hack_sourcefolder 'Hack_v2_010'

#dim hack_filenames[4]
#dim hack_fontnames[4]

#define hack_filenames[0] 'Hack-Bold.ttf'
#define hack_fontnames[0] 'Hack Bold (OpenType)'
#define hack_filenames[1] 'Hack-BoldOblique.ttf'
#define hack_fontnames[1] 'Hack Bold Italic (OpenType)'
#define hack_filenames[2] 'Hack-Regular.ttf'
#define hack_fontnames[2] 'Hack Regular (OpenType)'
#define hack_filenames[3] 'Hack-RegularOblique.ttf'
#define hack_fontnames[3] 'Hack Italic (OpenType)'

//Definition for Roboto Font
#define roboto_component 'roboto'
#define roboto_description 'Roboto by Christian Robertson'
#define roboto_sourcefolder 'Roboto_v2_1171'

#dim roboto_filenames[12]
#dim roboto_fontnames[12]

#define roboto_filenames[0] 'Roboto-Black.ttf'
#define roboto_fontnames[0] 'Roboto Black (OpenType)'
#define roboto_filenames[1] 'Roboto-BlackItalic.ttf'
#define roboto_fontnames[1] 'Roboto Black Italic (OpenType)'
#define roboto_filenames[2] 'Roboto-Bold.ttf'
#define roboto_fontnames[2] 'Roboto Bold (OpenType)'
#define roboto_filenames[3] 'Roboto-BoldItalic.ttf'
#define roboto_fontnames[3] 'Roboto Bold Italic (OpenType)'
#define roboto_filenames[4] 'Roboto-Italic.ttf'
#define roboto_fontnames[4] 'Roboto Italic (OpenType)'
#define roboto_filenames[5] 'Roboto-Light.ttf'
#define roboto_fontnames[5] 'Roboto Light (OpenType)'
#define roboto_filenames[6] 'Roboto-LightItalic.ttf'
#define roboto_fontnames[6] 'Roboto Light Italic (OpenType)'
#define roboto_filenames[7] 'Roboto-Medium.ttf'
#define roboto_fontnames[7] 'Roboto Medium (OpenType)'
#define roboto_filenames[8] 'Roboto-MediumItalic.ttf'
#define roboto_fontnames[8] 'Roboto Medium Italic (OpenType)'
#define roboto_filenames[9] 'Roboto-Regular.ttf'
#define roboto_fontnames[9] 'Roboto (OpenType)'
#define roboto_filenames[10] 'Roboto-Thin.ttf'
#define roboto_fontnames[10] 'Roboto Thin (OpenType)'
#define roboto_filenames[11] 'Roboto-ThinItalic.ttf'
#define roboto_fontnames[11] 'Roboto Thin Italic (OpenType)'



;General procedure
; a) Welcome page (might be disabled later on)
; b) License is shown
; c) Readme is displayed


  

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
Name: "{#roboto_component}"; Description: "{#roboto_description}"; Types: full; Flags: disablenouninstallwarning;

[Icons]
Name: "{app}\Fonts Applet"; Filename: "control.exe"; Parameters: "/name Microsoft.Fonts"; WorkingDir: "{win}";

;The links to the homepage are only created if the user has selected the matching component
Name: "{app}\{#hack_description} Homepage"; Filename: "https://github.com/chrissimpkins/Hack"; Components: {#hack_component};
Name: "{app}\{#roboto_description} Homepage"; Filename: "https://github.com/google/roboto"; Components: {#hack_component};

;Name: "{app}\Lato Homepage"; Filename: "http://www.latofonts.com/"; 


[Files]
;Copy license files - always copied
Source: "licenses/*.*"; DestDir: "{app}"; Flags: ignoreversion;

;Install Hack font
#define public i 0
#sub Sub_HackFiles
  Source: "fonts\{#hack_sourcefolder}\{#hack_filenames[i]}"; FontInstall: "{#hack_fontnames[i]}"; Components: {#hack_component}; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
#endsub
#for {i = 0; i < DimOf(hack_filenames); i++} Sub_HackFiles
#undef i

;Install Roboto font
#define public i 0
#sub Sub_RobotoFiles
  Source: "fonts\{#roboto_sourcefolder}\{#roboto_filenames[i]}"; FontInstall: "{#roboto_fontnames[i]}"; Components: {#roboto_component}; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
#endsub
#for {i = 0; i < DimOf(roboto_filenames); i++} Sub_RobotoFiles
#undef i


[InstallDelete]
;If a user copies *.TTF files to the "Fonts" applet and a font file with the same name already exists, Windows will simply append "_0" (or _1) to the font file and copy it.
;These "ghost" files need to be exterminated!

;Helper macro to add something to a filename before the extension
#define public AddStringToEndOfFilename(str fileName, str whatToAdd) \
  StringChange(fileName, '.'+ExtractFileExt(filename), whatToAdd + '.' + ExtractFileExt(fileName))

;Delete Hack ghost files
#define public i 0
#sub Sub_HackFilesRemove
  Type: files; Name: "{fonts}\{#AddStringToEndOfFilename(hack_filenames[i],'_*')}"; Components: {#hack_component}; 
#endsub
#for {i = 0; i < DimOf(hack_filenames); i++} Sub_HackFilesRemove
#undef i

;Delete roboto ghost files
#define public i 0
#sub Sub_RobotoFilesRemove
  Type: files; Name: "{fonts}\{#AddStringToEndOfFilename(roboto_filenames[i],'_*')}"; Components: {#roboto_component};
#endsub
#for {i = 0; i < DimOf(roboto_filenames); i++} Sub_RobotoFilesRemove
#undef i



 
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

  //SHA1 hashes for fonts already installed
  InstalledFontsHashes: array of string;

  //True if have stopped FontCache service
  FontCacheService_Stopped:boolean;
  FontCache30Service_Stopped:boolean;

  //True if the action has been run
  BeforeInstallActionWasRun:boolean;


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


//Prepare FontFiles and FontFilesHashes arrays
procedure FillFontData();
begin

//Helper macro to generate a pascal script function call with the font filename and the SHA1 hash 
#define public AddFontDataMacro(str fileName, str component, str SHA1Hash) \
  '  AddFontData(''' + component + '''' + ', ''' + fileName + ''', ''' + SHA1Hash + ''');'

//Helper macro to generate a SHA1 hash for a font file
#define public GetSHA1OfFontFile(str fontFolder, str fontFile) \
  GetSHA1OfFile(base_path + 'fonts\' + fontFolder + '\' + fontFile)


#undef public i

//Loop over all hack fonts
#define public i 0  
#sub Sub_HackGenerateHash
 #emit  AddFontDataMacro(hack_filenames[i], hack_component, GetSHA1OfFontFile(hack_sourcefolder, hack_filenames[i])) 
#endsub
#for {i = 0; i < DimOf(hack_filenames); i++} Sub_HackGenerateHash
#undef i

//Loop over all roboto fonts
#define public i 0  
#sub Sub_RobotoGenerateHash
 #emit  AddFontDataMacro(roboto_filenames[i], roboto_component, GetSHA1OfFontFile(roboto_sourcefolder, roboto_filenames[i])) 
#endsub
#for {i = 0; i < DimOf(roboto_filenames); i++} Sub_RobotoGenerateHash
#undef i



end;


procedure InitializeWizard;
var
  title, subTitle:string;
begin
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


//Returns TRUE if a difference between the alrady calculated HASH values for any file for the component 
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

//Called for each font that should be installed
//InnoSetup might call this function BEFORE our BeforeInstallAction is run. If this happens, we will always return TRUE
function FontFileInstallationRequired(): Boolean;
var
 file:string;
 i:integer;
 entryFound:boolean;
begin 
  if BeforeInstallActionWasRun=false then begin
     result:=true;
  end else begin 
     //This is the "real" thing once BeforeInstallAction was run
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

     //Sanity check
     if entryFound=false then begin
        RaiseException('No entry in the internal hash arrays found for: ' + file);
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
  
  //If this true we will make changes to this system
  ChangesRequired:boolean;
begin
  log('---BeforeInstallAction---');

  customPrepareToInstall.SetProgress(0, 0);
  customPrepareToInstall.Show;

  try
    begin

     //Calculate the SHA1 hash for *ALL* fonts we support
     customPrepareToInstall.SetText('Calculating hashes for fonts already installed...', '');
     
     SetArrayLength(InstalledFontsHashes, GetArrayLength(FontFiles));
     
     for i := 0 to GetArrayLength(FontFiles)-1 do begin
         currentFont:=FontFiles[i];
         log('Calculating hash for '+currentFont);
         log('   File from setup:  ' +  FontFilesHashes[i]);    
         
         currentFontFileNameWindows:=ExpandConstant('{fonts}\'+currentFont);
    
         //Check the windows font folder for this entry and get the hash
         if FileExists(currentFontFileNameWindows) then begin
            InstalledFontsHashes[i]:=GetSHA1OfFile(currentFontFileNameWindows);
         end else begin
            InstalledFontsHashes[i]:='-NOT FOUND-';
         end;
     
         log('   File in \fonts  :  ' +  InstalledFontsHashes[i]);
     end;

     //Set it to false by default
     ChangesRequired:=false;

     //Now we need to know which components the user has selected and check if we have differences (based on the hash)
     //This step is necessary in order to make sure we do not start/stop services for files this setup included, 
     //but the user does not want to install it. In this case, the difference can be ignored.
     if IsComponentSelected('{#hack_component}') then begin        
        if FontFilesFromSetupAndWindowsAreDifferent('{#hack_component}') then begin
           ChangesRequired:=true;
        end;
     end;


     //If at least ine file will be installed, we will stop the "Windows Font Cache Service" and the "Windows Presentation Foundation Font Cache".
     //This will ensure that that these services update their internal database
     //If users still report about broken fonts, we will need to delete Font*.dat and ~Font*.dat from  C:\Windows\ServiceProfiles\LocalService\AppData\Local\ 
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
      PostMessage(-1, 29, 0, 0);
      //HWND_BROADCAST = -1
      //WM_FONTCHANGE = 0x1D = 29

   
  end;
  finally
    customPrepareToInstall.Hide;
  end;

  log('---AfterInstallAction END---');
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





#expr SaveToFile(AddBackslash(SourcePath) + "zz_Temp_Preprocessed.iss")
