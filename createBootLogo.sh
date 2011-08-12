#!/bin/bash
#
# createBootLogo.sh
#
# for use with morfic's Samsung-logo binary
# https://github.com/morfic/Samsung-logo/
#
# 2011 nubecoder
# http://www.nubecoder.com/
#
#
# g++ -o makelogo makelogo.cpp > /dev/null 2>&1
# ./makelogo > boot_logo.h
# cat boot_logo.h > logo_rgb24_wvga_portrait_custom.h
# cat charge_logo.h >> logo_rgb24_wvga_portrait_custom.h

#defines
DST_FILE="logo_rgb24_wvga_portrait_custom.h"
BINARY="makelogo"
BOOT_LOGO="boot_logo.h"
CHARGE_LOGO="charge_logo.h"

#functions
SPACER()
{
	echo "*"
}
START_SCRIPT()
{
	TIME_START=$(date +%s)
	SPACER
}
SHOW_COMPLETED()
{
	SPACER
	echo "Script completed."
	TIME_END=$(date +%s)
	echo "Total time: $(($TIME_END - $TIME_START)) seconds."
	SPACER
	exit
}
BUILD_BINARY()
{
	echo "Building binary..."
	# remove old files
	rm -f $BINARY
	# build binary
	local RESULT=$(g++ -o $BINARY $BINARY.cpp 2>&1 >/dev/null)
	# make binary executable
	chmod +x $BINARY
}
CREATE_LOGO()
{
	echo "Creating bootlogo..."
	# remove old files
	rm -f $BOOT_LOGO
	rm -f $DST_FILE
	# convert header to usable data
	./$BINARY > $BOOT_LOGO
	# output to file
	cat $BOOT_LOGO > $DST_FILE
	cat $CHARGE_LOGO >> $DST_FILE
}
CLEANUP()
{
	echo "Cleaning up files..."
	# remove files
	rm -f $BOOT_LOGO
	rm -f $BINARY
}

#main
START_SCRIPT
BUILD_BINARY
CREATE_LOGO
CLEANUP
SHOW_COMPLETED

