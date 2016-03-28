# Open Source Font Pack (OSFontPack)

An installer for selected Open Source Fonts for Windows.

## Included Fonts

* [Hack by Christopher Simpkins](https://github.com/chrissimpkins/Hack)
* [Lato by Lukasz Dziedzic](http://www.latofonts.com/)
* [Roboto by Christian Robertson](https://github.com/google/roboto)
* [Source Sans Pro by Adobe Inc.](https://github.com/adobe-fonts/source-sans-pro)

## Usage

- Download from [Releases](https://github.com/texhex/OSFontPack/releases/)
- Run OSFontPack.exe
- Follow the instructions
- Enjoy 

## Silent Installation

To install silently, use the following command:

 ``start /wait OSFontPack.exe /TYPE=full /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /CLOSEAPPLICATIONS /NORESTARTAPPLICATIONS``

To install only some fonts (e.g. Hack and Lato) use:

 ``start /wait OSFontPack.exe /COMPONENTS=hack,lato /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /CLOSEAPPLICATIONS /NORESTARTAPPLICATIONS``

Supported components are: ``hack lato roboto sourcesans``.

To remove everything silently: 

 ``C:\Program Files\Open Source Font Pack\unins000.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART``

## Troubleshooting

OSFontPack.exe always creates a log file as C:\Users\ (Username) \AppData\Local\Temp\Setup Log (Year-Month-Day) #<XXX>.txt.

Note that if you have EMET active with the "Only trusted fonts" option you need to declare the fonts as trusted or they will not be visible.

## Contributions

Any constructive contribution is very welcome! 

If you encounter a bug with the installation, please create a new issue, describing how to reproduce the bug and I will try to fix it.

In case you want the setup to include another font, please also open an issue and I will consider adding it. Please note: I will not accept fonts without any project activity for more than a year. 

## About
Copyright © 2016 [Michael Hex](http://www.texhex.info/). Licensed under the **MIT License**. For details, please see LICENSE.txt.
