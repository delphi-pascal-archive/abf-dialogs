================================================================
ABF Shell Menu DLL.

ABF software, Inc.
e-mail: info@ABFsoftware.com
web:    http://www.ABFsoftware.com

Copyright (c) 2000, 2001 ABF software, Inc.
All Rights Reserved.
================================================================


Description
===========
This library is an implementation of shell context menu. Using this sources you'll be able to create own context menus very easily. Just copy all files of this project to own directory, change some constants and follow TO-DO notes. Edit “abfShellMenu.res” file to change or add own bitmaps. Source code is well commented, so spend some time to read all of them. 


Notes
=====
This library adds 3 (5 with separators) menu items to context menu of each folder by default. Use {$Define DEBUG} compiler directive to receive debug messages in the log file. The log file will be placed in the Windows root dir (C:\Windows for example) with “explorer.log” name.


How to use?
===========
To register this library use: 
  Regsvr32.exe abfShellMenu.dll 

To unregister this library use: 
  Regsvr32.exe -u abfShellMenu.dll 

If you have any questions contact our support team:
  support@ABFsoftware.com


Requirements
============
* Borland Delphi 4 (or higher)
* OS: Windows 95/98/Me/NT4/2000. 


History
=======
July 19, 2001. (Version 1.0):
First public release.


================================================================
Copyright (c) 2000, 2001 ABF software, Inc. 
All Rights Reserved.
================================================================
