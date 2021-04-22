gcc -o rms source/rms.c -std=c99 -lm
gcc -o peak source/peak.c -std=c99 -lm
gcc -o compander_1 source/compander_1.c -std=c99 -lm
gcc -o sin-compander source/sin-compander.c -std=c99 -lm
gcc -o wav_header source/wav_header.c -std=c99 -lm
chmod 775 master-compander.sh
