#!/usr/bin/bash
# Seth Kenlon <skenlon@redhat.com>

# GPLv3
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

CWD=`readlink -f "${0}"`

while [ True ]; do
if [ "$1" = "" -o "$1" = "-h" -o "$1" = "--help" ]; then
    echo "Usage: $0 [--sku SKU] [--mark left|right|center] [--output <filename>] input.pdf"
    exit
elif [ "$1" = "-m" -o "$1" = "--mark" ]; then
    MARK="$2"
    shift 2
elif [ "$1" = "-s" -o "$1" = "--sku" ]; then
    SKU="$2"
    shift 2
elif [ "$1" = "-o" -o "$1" = "--output" ]; then
    OUTPUT="$2"
    shift 2
else
    break
fi
done

INPUT="${1}"
set -e


# variables
FONT=/usr/share/fonts/redhat/RedHatDisplay-Regular.otf
#FONT=RedHatDisplay-Regular
#FONT=overpass-regular
TO=${TO:-5}
FROM=${FROM:-9}
SHARE="`dirname ${CWD}`"/share
OUTPUT=${OUTPUT:-toc-"$SKU".pdf}
set -e

if [[ ${MARK:0:1} = "l" ]]; then
    convert $SHARE/watermark-upper.pdf -depth 600 -fill black -font "${FONT}" -pointsize 24 -draw "text 21,96 '$SKU'" label-tmp.pdf
elif [[ ${MARK:0:1} = "r" ]]; then
    convert $SHARE/watermark-lower-right.pdf -depth 600 -fill black -font "${FONT}" -pointsize 24 -draw "text 512,690 '$SKU'" label-tmp.pdf
else
    cp $SHARE/watermark.pdf label-tmp.pdf
fi

pdftk "${INPUT}" dump_data output bookmarks.tmp
FROM=`$SHARE/tocfinder.awk -v find=start bookmarks.tmp`
TO=`$SHARE/tocfinder.awk -v find=stop bookmarks.tmp`
TO=`echo $TO - 1 | bc`

/bin/rm bookmarks.tmp

pdftk "${INPUT}" cat "$FROM"-"$TO" output tmp.pdf

pdftk tmp.pdf stamp label-tmp.pdf output "${OUTPUT}"-tmp.pdf

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=/printer -dNOPAUSE -dBATCH \
   -sOutputFile="${OUTPUT}" "${OUTPUT}"-tmp.pdf

\rm *tmp.pdf
