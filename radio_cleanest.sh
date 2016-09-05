#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
output="output/test_"
freq=94.1
rm ${output}${freq}.ogv
rtl_fm -f ${freq}M -M fm -s 200k -A std -l0  -E deem -r 44.1k - |  avconv -f s16le -ar 44100 -i pipe:0  -acodec libvorbis -qscale:a 7  "${output}${freq}.ogv" &
sleep 60
kill $(ps aux | grep rtl_fm | grep deem | awk '{print $2}')

