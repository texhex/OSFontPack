#Font Installation Issues

When creating this setup, and when deploying this setup to 200+ machines, I faced some issues that come from the fact that the Windows is not very smart when handling fonts. This file lists the issues I'm aware of.

##Font files can be damaged

For whatever reason, sometimes the *.ttf files are broken and depending how exactly they are broken can lead to all sorts of effects, ranging from "Font can't be used" to "Some glyphs are broken".

*OSFontPack.exe* uses SHA-1 hashes to compare the files that should be installed with the files actually installed. This has the side effect that always the files included with the setup are installed, even if one font file was already manually updated to a newer version. 

##The FONTS applet might save fonts as (Fontname)_X.ttf


Depending on the application and the caching method it can happen that the application continues to use the old font file.
 
*OSFontPack.exe* will delete any (Fontname)_*.ttf for each font file it installs. However, if a font file was renamed, *OSFontPack.exe* won’t delete the old _0.ttf file because this deletion is executed upon installation and depends on the current font names.

##Some fonts can be locked

As soon as a font is used, the TTF file for it is locked and can’t be updated to a newer version.


##The FontCache service can lock a fonts during installation

For performance reasons, Windows includes a cache for all installed fonts. Because it is sometime to “eager” to read the information from a file, the installation can fail because the file is locked during the installation.

##The font data in the registry and the font files can be different

Depending what else has gone wrong, the font registration data (Name and File) inside the registry can be different from the actual fonts installed in C:\WINDOWS\FONTS. When this happens, the fonts can go “crazy” - see issue [#152 for Hack](https://github.com/chrissimpkins/Hack/issues/152).

*OSFontPack.exe* will ensure that the files and the registration data are exactly as desired and reinstall the font if this is not the case.

##A new font is not visible in any application directly after installation

When a new font is installed, Windows expects the broadcast message WM_FONTCHANGE before the font can be used. 

*OSFontPack.exe* will sent this message if any new font is installed. However, some applications do not react on this message so a restart will be requested when the installation is finished.

##A font cannot be updated without restart

The [MSDN  docs](https://msdn.microsoft.com/en-us/library/windows/desktop/dd183326%28v=vs.85%29.aspx) say that a call to RemoveFontResource() requires a restart before this font is really removed. However, it does not say anything if updating a font also requires this. Based on the current findings, I think it is required.

*OSFontPack.exe* will always request a restart when the installation is finished. 


##Not fixed: The cache files of the FontCache service can be corrupted

This issue is not yet fixed by *OSFontPack.exe* mostly because I never experienced this defect. 

Both font cache services (FontCache and FontCache3.0.0.0) use a cache stored in *C:\Windows\ServiceProfiles\LocalService\AppData\Local\*. When these files become corrupted, the services might hang and the entire font handling goes haywire. 


After that, restart the computer. 


----------
2016-03-29
~Michael 'Tex' Hex

