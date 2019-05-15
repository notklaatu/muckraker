# Muckraker

This script extracts the table of contents from a Red&nbsp;Hat course, places a logo and SKU number in either the upper-left or lower-right margin, or just a half-transparent logo across the middle of the page. 

This can be used for quick-reference by anyone who needs an overview of the scope of the course.

## Requirements

* Tested on [Red&nbsp;Hat](https://www.redhat.com/en/store/linux-platforms) and [Fedora](https://getfedora.org) GNU+Linux only. It may work on some other POSIX.
* GNU Awk
* pdftk
* ImageMagick


### Installing pdftk

If your distribution doesn't provide pdftk, the easiest way to get it may be to install [Snap](https://snapcraft.io).

Once Snap is installed and the ``snapd`` daemon is started, install [pdftk](https://snapcraft.io/pdftk).

Try it out:

    $ pdftk --version
	
If ``pdftk`` cannot be found, then you probably need to do this:

    $ sudo ln -s /var/lib/snapd/snap /snap

Then add ``/snap`` to your PATH.


## Install

Clone this repository (or just download a ZIP snapshot of its current state).

Then place the project directory in ~/bin or some other location in your PATH.


## Usage 

    $ ~/bin/muckraker/muckraker.sh --sku RH000 --mark left path/to/RH000-course.pdf
	
