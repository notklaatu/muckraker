#!/usr/bin/gawk -f
# find start and stop of TOC based on pdftk data dump
# this is not meant as a standalone script 
# Seth Kenlon <skenlon@redhat.com>

# GPLv3
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

BEGIN {
    FS=": "

    if ( find == "start" ) 
    {
	chapter="Table of Contents";
    } else {
	chapter="Document Conventions";
    }

    key="BookmarkPageNumber";
    f=0
}

$2==chapter {
    f=1; next
}

/BookmarkBegin/ {
    f=0; next 
}

f && $1==key { 
    num=$2;
    printf "%s\n", num;
}

