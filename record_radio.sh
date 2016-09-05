#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
output="output/test.ogv"
rm "${output}"
rtl_fm -f 94.1e6 -M fm -s 200k -A fast -l 0 -E deem -r 44.1k - |  avconv -f s16le -ar 44100 -ac 1 -i pipe:0  -acodec libvorbis -qscale:a 5  ${output}
