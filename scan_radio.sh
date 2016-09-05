#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
output="output/test_"
for count in $(seq 0 15)
do
    freq=94.${count}
    rtl_fm -f ${freq}M -M fm -s 200k -A std -l0  -E deem -r 44.1k - |  avconv -f s16le -ar 44100 -ac 1 -i pipe:0  -acodec libvorbis -qscale:a 5  "${output}_${freq}.ogv" &
    sleep 20
    kill $(ps aux | grep rtl_fm | grep deem | awk '{print $2}')

done
