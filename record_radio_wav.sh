#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
outfile="output/test.wav"
rm "${outfile}"
rtl_fm -f 94.1e6 -M wbfm -s 200000 -r 44100 - |  avconv -f s16le -ar 44100 -ac 1 -i pipe:0  -acodec pcm_s16le ${outfile}
