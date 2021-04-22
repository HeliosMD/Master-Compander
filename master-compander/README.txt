MASTER COMPANDER - V.0.2
By: Helios Martinez Dominguez
Estudio Siddhi - Copyleft 2021.

Master Compander is a transparent single pass audio mastering tool designed to accomplish with audio mastering industry requirements.
As for now, it processes 16bit audio files using COMPANDER_1 and SIN-COMPANDER curve companders. Binaries for Linux are distributed.
Sometimes, binaries distributed may fail to execute, in such case you need to compile the application from source.
This is due to differences between distributions (x86/x64, etc).

How to compile from source:

For the compilation process you would need GCC (GNU C compiler) installed (most Linux distributions have it by default).
First, after decompressing the files into the master-compander/ directory, you have to provide the "compile.sh" with execution priviledges:

	$ sudo chmod 775 compile.sh

Then, just invoque:

	$ ./compile.sh

All binaries will compile. Once compiled, the files need to be in the same directory as the "master-compander.sh" file (this is done automatically).
In case compilation fails, each source file can also be compiled separatedly by invocating the compiler and specifing it's output.
Sometimes linking math.h is also necessary. "compiles.sh" script also provides priviledges of execution to the "master-compander.sh" file.

Example:

	$ gcc -o rms rms.c -std=c99 -lm
	$ gcc -o peak peak.c -std=c99 -lm
	$ gcc -o wav_header wav_header.c -std=c99 -lm
	$ gcc -o compander_1 compander_1.c -std=c99 -lm
	$ gcc -o sin-compander sin-compander.c -std=c99 -lm
	$ sudo chmod 775 master-compander.sh

How to use it:

Open the Terminal Emulator or Shell (bash, zsh, etc).
Get into the master-compander/ folder or directory.
Then execute:

$ ./master-compander.sh path/audiofile.wav

Where "path/audiofile.wav" is the audio file to be mastered. That is pretty much it!.
The Master Compander will check on the audiofile's RMS and Peak values and provide for RMS and Peak values for the output audio file.
After the mastering process, there will be a new audio file named with "-master.wav" as a suffix. That is you mastered audio file.

This is a typical screen:

	helios@helios-CQ1115LA:~$ ./master-compander.sh supercuerdas/supercuerdas_09.wav
	MASTER COMPANDER - V.0.2
	By: Helios Martinez Dominguez
	Estudio Siddhi - Copyleft 2021.

	Mastering:
	supercuerdas/supercuerdas_09.wav

	Standard WAV Header
	Channels: 2
	Bits per Sample: 16
	Sample Rate: 44100
	44 bytes header

	Input RMS:
	-22.724276 dB
	Input Peak:
	-2.989723 dB

	COMPANDER_1 (Processing - 64bit floating point)

	SIN-COMPANDER (Processing - 64bit floating point)

	Output RMS:
	-15.826052 dB
	Output Peak:
	-0.468956 dB

	Mastered:
	supercuerdas/supercuerdas_09.wav-master.wav
	helios@helios-CQ1115LA:~$ 

How it works:

Master Compander works making use of five main processes, each provided as a separate executable and joined together through a script shell.
First, the script file provides for a Title, Author and Copyleft information.
At this point, Master Compander shows WAV header file information.
Then, RMS of the input is calculated by scanning the whole audiofile.
After that, Peak value is also calculated scannig the whole audio file.
Up to this point there is no process being done to the audio file.
This information is required for debugging purposes due to a bug in which some WAV files header information is lost due to poor handling (i have to fix that!).
Then, COMPANDER_1 is exectued on the audio file, providing a temporal audio file named after the input file with the "-pre-master.wav" suffix added.
This process increases harmonic content by applying a compressing curve to the whole audio file data.
Then, SIN-COMPANDER is executed on the pre-master audio file, postprocessing it.
SIN-COMPANDER process it through a companding curve, expanding and compressing the dynamic range.
COMPANDER_1 and SIN_COMPANDER are not linear compressors or expanders, they are based on mathematical curves, different each one.
After this process is done, the output file is named after the original audio file with the "-master.wav" suffix.
When the whole operation is complete, the temporal file (pre-master) is removed.
Output audio file is then measured again for it's RMS and Peak values.

About the author:

Helios Martinez Dominguez is a musician and audio engineer. Is the recording, mix and master engineer of Estudio Siddhi.
There are more than thirty records recorded, mixed and mastered in his experience. Some can be listened (and downloaded) at:

https://helios70.bandcamp.com
https://heliosmartinezdominguez.bandcamp.com
https://avrvm-music.bandcamp.com
https://bounces.bandcamp.com
https://judaslion.bandcamp.com

Bugs fixed:
- Some WAV files with non-standard headers required RAW importing after the mastering process, due to incomplete wav header management.

Known bugs:
- Incomplete handling when input file is inexisting or filename contain spaces.

TODO:
- Percentage increase and progress bar while processing audio file.
- Migrate master-compander.sh to C language.
- 24bit precission handling.
- AIFF support.
