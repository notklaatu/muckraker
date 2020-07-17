# Muckraker

This script extracts the table of contents from a Red&nbsp;Hat course, places a logo and SKU number in either the upper-left or lower-right margin, or just a half-transparent logo across the middle of the page. 

This can be used for quick-reference by anyone who needs an overview of the scope of the course.

## Requirements

* Tested on [Red&nbsp;Hat](https://www.redhat.com/en/store/linux-platforms) and [Fedora](https://getfedora.org) GNU+Linux only. It may work on some other POSIX.
* GNU Awk
* [OpenJDK](https://adoptopenjdk.net/) or some Java runtime
* [pdftk-java](https://gitlab.com/pdftk-java/pdftk)
* ImageMagick

### Install Java

Download and install Java from [AdoptOpenJDK](https://adoptopenjdk.net) or grab the latest Java install from your distribution's software repository.

### Install pdftk-java

If your distribution doesn't provide ``pdftk``, then the easiest way to get it is [pdftk-java](https://gitlab.com/pdftk-java/pdftk)

First, download the [native image](https://gitlab.com/pdftk-java/pdftk/-/releases). Don't download the source code unless you really want to build a Java project from source.

Next, place the file in some location on your path.
It's common to keep a folder of binaries in your home directory (such as ``$HOME/bin``) but you can place it anywhere (``/opt`` or ``/usr/local/bin`` are good candidates) as long as it's in your [PATH](https://opensource.com/article/17/6/set-path-linux).

Once installed, try it out:

    $ chmod +x /path/to/pdftk
    $ pdftk --version
	pdftk port to java X.Y.Z for Manipulating PDF Documents

## Install ImageMagick

Install ImageMagick from your distribution's software repository.

## Install Awk

You probably already have Awk, but make sure you have GNU Awk (``Gawk``) specifically.
If not, it's probably available from your repository or ports tree.

## Install

Clone this repository (or just download a ZIP snapshot of its current state).

Place the project directory in ``~/bin`` or some other location in your PATH. 

## Usage 

    $ ~/bin/muckraker/muckraker.sh --sku RH000 --mark left path/to/RH000-course.pdf
	
