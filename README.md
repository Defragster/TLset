# TlSet
Teensy Setting IDE Tools

For Windows - a Batch file to create another local sketch folder Batch file that will run the Arduino IDE build system.  Using SublimeText it has a BUILD system that will execute this batch file, it can also be run from Windows command line - or perhaps your editor can run it as well.

* SublimeText will go to code in error - NOTE: Sometimes it goes to the TEMP build folder not source file - be aware of that if changes don't stick

* Latest FORUM post (12 July 2020) update Here [https://forum.pjrc.com/threads/38391-Use-Sublime-Text-as-an-Arduino-IDE-replacement?p=245999&viewfull=1#post245999]
> GDB debugger from TlSet linked there for Teensy debugging with command line build
> Edits made to allow the sketch.INO file to be placed into the resulting Compile.CMD file to avoid build problems when ,ultiple INO's in project sketch folder would trigger the IDE Build with the wrong INO breaking the build.
> Updates to Sublime Text Build System are in above linked post.

This is an extention of work by Frank Boesing [https://github.com/FrankBoesing]  - that actually is the Batch file that runs the Arduino Builder outside the IDE. 

Install a supported Arduino IDE {tested 1.8.13} and TeensyDuino {tested 1.53} combination - and TyCommander by Koromix [ https://github.com/Koromix/tytools ].

* With latest TyCommander release (7Aug 2020) [ https://github.com/Koromix/tytools/releases/tag/v0.9.2 ] or newer when 'not Integrated' a build with TlSet will prompt first time for 'which Teensy' and it will be placed into bootloader mode triggering Teensy Loader to AUTO program the sketch HEX to that Teensy as part of the build without having to manually do that (or Button push) as before.  It takes a rebuild of the Compile.cmd file for this to take effect.

It can be run fully from CMD window to build Compile CMD and run it, or once built double clicking Compile.CMD exeuctes the build from File Explorer.

Now supports using libraries from PORTABLE folder created in Arduino IDE path.

The TlSet.cmd file asks questions to specify the Teensy Board, MCU Speed, Compile Optimization level and USB type. Then it asks to approve or restart the selection if a wrong choice was made.  It also allows creating a subfolder based on Teensy Model to hold the file so the same build batch file can be created for run any of the T_LC, T_3.2/3.2, T_3.5, T_3.6 or T_4.0 and T_4.1.

TO USE :: Put the files from the repository in a known folder.
Run TlSet.cmd ( must include extention .cmd ) from the Sketch folder where the INO is stored for IDE usage.  It can run from within your IDE or from CMD line or Explorer window.

NOTE: You must edit TlSet.cmd1 to have proper folder paths to your local system. 
* rem Edit these paths:
* set arduino=T:\arduino-1.8.13
* set TyTools=T:\TyComm
* set libs=T:\tCode\libraries
* set tools=T:\Programs\TlSet

NOTE: A recent change attempts to embed the 'sketch.ino' name when building the Compile.cmd when it is passed in to avoid confusion when multiple INO files exist in the same sketch folder. The old 'first found' method is used when that isn't provided. It takes a rebuild of the Compile.cmd file for this to take effect.

NOTE: If you aren't an English keyboard user make an edit to TlSet.cmd2 from the specified: keys=en-us.

NOTE: for 'NEW' to work edit open_new.cmd [ sbook, srcdir ] to point to sketchbook folder and the source directory holding TlSet files.

Other note: Nothing stops making a bad combination - like asking for a 256 MHZ T_3.5 - so that would cause a build to fail.

Given that this is Teensy specific it started here with FrankB's posted batch file to run the Arduino IDE's builder in a shell: https://forum.pjrc.com/threads/27825-Teensy-Qt?p=190940&viewfull=1#post190940

The addition here is the batch file with prompts for the Teensy IDE settings being programmatically merged into the initial batch file that would require hand editing of the numerous options for Teensy Model, MCU Speed, Optimization level and one of the many USB options available.  This was posted on the PJRC forum in the context of use with SublimeText - more setails for setup below.

That links to the updated version allowing the batch file to be placed in the specific Teensy Model folder to allow sending the same sketch to be sent to other models and only set it up once per model, the Compile.cmd must be run from that directory.

Added 'open_new.cmd' [Must edit the specified sketchbook(sbook) and TlSet home directory (srcdir)] option to create the IDE type Sketch in same name folder with a base 'new_ino.ino' sketch, prompts for selecting subfolder in sketchbook directory, and offers to run TlSet to create Compile.cmd.

Works on TeensyDuino 1.53 - All ARM Teensys [with TyComm] as released

This works perfectly in SublimeText as a " Tools / Build System " to setup:: From Sublime Menu:: Tools/ Build System/ New build system ???
Links below may be helpful but th ebest with 'NEW' is at https://forum.pjrc.com/threads/38391-Use-Sublime-Text-as-an-Arduino-IDE-replacement?p=193211&viewfull=1#post193211 ... 
https://forum.pjrc.com/threads/38391-Use-Sublime-Text-as-an-Arduino-IDE-replacement?p=193093&viewfull=1#post193093 is how I started. That gives a way to create the file I have on github [ https://github.com/Defragster/TlSet/blob/master/SublimeText.txt ]. You can then copy the contents into it and save. [the %appdata% path there would let you manually create and save the named file and I suspect it will get picked up]. Then Under: Tools/ Build System I see ???Teensy??? [as I named it] that I selected as the build system and that triggers that with Ctrl+Shift+B to select the variation and Ctrl+B or F7 to run the last used variation. Other Notes:: refer to the post:: https://forum.pjrc.com/threads/38391-Use-Sublime-Text-as-an-Arduino-IDE-replacement?p=193136&viewfull=1#post193136

* This works for my use using SublimeText on Window 10 - hopefully yours too - if not please make an ISSUE

