echo MASTER COMPANDER - V.0.2
echo By: Helios Martinez Dominguez
echo Estudio Siddhi - Copyleft 2021.
echo
echo Mastering:
echo $1
echo
./wav_header $1
echo
echo Input RMS:
./rms $1
echo Input Peak:
./peak $1
echo
./compander_1 $1 $1-pre-master.wav 2.0
echo
./sin-compander $1-pre-master.wav $1-master.wav
echo
rm $1-pre-master.wav
echo Output RMS:
./rms $1-master.wav
echo Output Peak:
./peak $1-master.wav
echo
echo Mastered:
echo $1-master.wav
