#!/bin/sh
#

cd ./bin

executable=vhusbdarm

if [ -f $executable ]
then
	echo Run VHUSB Server in background mode.
	exec ./$executable -b
else
	echo Downloading the VHUSB Server with WGET.
	wget https://virtualhere.com/sites/default/files/usbserver/vhusbdarm
	# MISSING! Check return code, file etc...
	chmod a+x ./$executable
	echo ... and running it in background mode.
	exec ./$executable -b
fi

#NOTES:
# GUI Idea - enable user to edit the config.ini and (re)start the vhusbdarm deamon (automatically if config was modified).
# Pid management? for later killing?
# How to Verify integrity of the downloaded server? Show sha256s of binary on first install or sth?
# If the "App" is removed while the deamon is still running, the files/dirs are removed but the deamon stays until the next power cycle.
#   ... don't know what happens if the deamon tries to use it's config.ini
