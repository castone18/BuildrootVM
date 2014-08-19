#!/bin/bash

echo "Provisioning BuildrootVM..."

cd /home/tc

/bin/su tc -c "/usr/bin/tce-load -wi compiletc"
/bin/su tc -c "/usr/bin/tce-load -wi git"
/bin/su tc -c "/usr/bin/tce-load -wi svn"
/bin/su tc -c "/usr/bin/tce-load -wi wget"
/bin/su tc -c "/usr/bin/tce-load -wi ncurses-dev"
/bin/su tc -c "/usr/bin/tce-load -wi ncurses-utils"
/bin/su tc -c "/usr/bin/tce-load -wi perl5"
/bin/su tc -c "/usr/bin/tce-load -wi tar"
/bin/su tc -c "/usr/bin/tce-load -wi rsync"
/bin/su tc -c "/usr/bin/tce-load -wi python"
/bin/su tc -c "/usr/bin/tce-load -wi bc"
/bin/su tc -c "/usr/bin/tce-load -wi mktemp"

/bin/su tc -c "git clone http://git.buildroot.net/git/buildroot.git"

echo "Provisioning done."
