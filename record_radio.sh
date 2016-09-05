#!/bin/bash
output="output/test.ogv"
rm "${output}"
rtl_fm -f 94.1M -M wbfm -s 200k -r 44.1k - |  avconv -f s16le -ar 44100 -ac 1 -i pipe:0  -acodec libvorbis -qscale:a 5  ${output}
