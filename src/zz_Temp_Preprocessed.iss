; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS


; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS







; ISPP: Base Path C:\dev\git\OSFontPack\













;General procedure
; a) Welcome page (might be disabled later on)
; b) License is shown
; c) Readme is displayed


  

[Setup]
AppId=OSFontPack
SetupMutex=OSFontPack_Setup_Mutex 

AppName=Open Source Font Pack
AppVersion=0.4.1
VersionInfoVersion=0.4.1

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
Name: "roboto"; Description: "Roboto by Christian Robertson"; Types: full; Flags: disablenouninstallwarning;

[Icons]
Name: "{app}\Fonts Applet"; Filename: "control.exe"; Parameters: "/name Microsoft.Fonts"; WorkingDir: "{win}";

;The links to the homepage are only created if the user has selected the matching component
Name: "{app}\Hack by Christopher Simpkins Homepage"; Filename: "https://github.com/chrissimpkins/Hack"; Components: hack;
Name: "{app}\Roboto by Christian Robertson Homepage"; Filename: "https://github.com/google/roboto"; Components: hack;

;Name: "{app}\Lato Homepage"; Filename: "http://www.latofonts.com/"; 


[Files]
;Copy license files - always copied
Source: "licenses/*.*"; DestDir: "{app}"; Flags: ignoreversion;

;Install Hack font
  Source: "fonts\Hack_v2_010\Hack-Bold.ttf"; FontInstall: "Hack Bold (OpenType)"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Hack_v2_010\Hack-BoldOblique.ttf"; FontInstall: "Hack Bold Italic (OpenType)"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Hack_v2_010\Hack-Regular.ttf"; FontInstall: "Hack Regular (OpenType)"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Hack_v2_010\Hack-RegularOblique.ttf"; FontInstall: "Hack Italic (OpenType)"; Components: hack; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 

;Install Roboto font
  Source: "fonts\Roboto_v2_1171\Roboto-Black.ttf"; FontInstall: "Roboto Black (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-BlackItalic.ttf"; FontInstall: "Roboto Black Italic (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Bold.ttf"; FontInstall: "Roboto Bold (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-BoldItalic.ttf"; FontInstall: "Roboto Bold Italic (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Italic.ttf"; FontInstall: "Roboto Italic (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Light.ttf"; FontInstall: "Roboto Light (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-LightItalic.ttf"; FontInstall: "Roboto Light Italic (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Medium.ttf"; FontInstall: "Roboto Medium (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-MediumItalic.ttf"; FontInstall: "Roboto Medium Italic (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Regular.ttf"; FontInstall: "Roboto (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-Thin.ttf"; FontInstall: "Roboto Thin (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 
  Source: "fonts\Roboto_v2_1171\Roboto-ThinItalic.ttf"; FontInstall: "Roboto Thin Italic (OpenType)"; Components: roboto; DestDir: "{fonts}"; Check: FontFileInstallationRequired; Flags: ignoreversion fontisnttruetype restartreplace; 


[InstallDelete]
;If a user copies *.TTF files to the "Fonts" applet and a font file with the same name already exists, Windows will simply append "_0" (or _1) to the font file and copy it.
;These "ghost" files need to be exterminated!

;Helper macro to add something to a filename before the extension

;Delete Hack ghost files
  Type: files; Name: "{fonts}\Hack-Bold_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Hack-BoldOblique_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Hack-Regular_*.ttf"; Components: hack; 
  Type: files; Name: "{fonts}\Hack-RegularOblique_*.ttf"; Components: hack; 

;Delete roboto ghost files
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



 
[INI]
;Create an ini to make detection for enterprise deployment tools easy
Filename: "{app}\InstallInfo.ini"; Section: "Main"; Key: "Version"; String: "0.4.1"

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





  AddFontData('hack', 'Hack-Bold.ttf', '69f032eb469c750c28398faab2f04925d154886d');
  AddFontData('hack', 'Hack-BoldOblique.ttf', '5f99ac271a95b11d77298db83fc876fb80392c56');
  AddFontData('hack', 'Hack-Regular.ttf', '057059d5f04113f1a08bd497c7e85b9bb201305e');
  AddFontData('hack', 'Hack-RegularOblique.ttf', '4c652eaa1b9c3d4ffb9b27f2f707b6a566486203');

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



end;


procedure InitializeWizard;
var
  title, subTitle:string;
begin
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
  
  ChangesRequired:boolean;
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
         log('   File from setup:  ' +  FontFilesHashes[i]);    
         
         currentFontFileNameWindows:=ExpandConstant('{fonts}\'+currentFont);
    
         if FileExists(currentFontFileNameWindows) then begin
            InstalledFontsHashes[i]:=GetSHA1OfFile(currentFontFileNameWindows);
         end else begin
            InstalledFontsHashes[i]:='-NOT FOUND-';
         end;
     
         log('   File in \fonts  :  ' +  InstalledFontsHashes[i]);
     end;

     ChangesRequired:=false;

     if IsComponentSelected('hack') then begin        
        if FontFilesFromSetupAndWindowsAreDifferent('hack') then begin
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


      PostMessage(-1, 29, 0, 0);

   
  end;
  finally
    customPrepareToInstall.Hide;
  end;

  log('---AfterInstallAction END---');
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





