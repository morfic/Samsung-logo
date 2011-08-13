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
BOOT_LOGO="custom_boot_logo.h"
CHARGE_LOGO="custom_charge_logo.h"
BOOT_BINARY="makebootlogo"
CHARGE_BINARY="makechargelogo"

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
	echo "Building $1 binary..."
	# remove old files
	rm -f $1
	# build binary
	local RESULT=$(g++ -o $1 $1.cpp 2>&1 >/dev/null)
	# make binary executable
	chmod +x $1
}
CREATE_LOGO()
{
	echo "Creating $1..."
	# remove old files
	rm -f $1
	# generate usable data
	./$2 > $1
}
CREATE_DST_FILE()
{
	echo "Creating $DST_FILE..."
	# remove old files
	rm -f $DST_FILE
	# output to file
	cat $1 > $DST_FILE
	cat $2 >> $DST_FILE
}
CLEANUP()
{
	echo "Cleaning up files..."
	# remove files
	rm -f $BOOT_LOGO
	rm -f $CHARGE_LOGO
	rm -f $BOOT_BINARY
	rm -f $CHARGE_BINARY
}

#main
START_SCRIPT
BUILD_BINARY "$BOOT_BINARY"
BUILD_BINARY "$CHARGE_BINARY"
CREATE_LOGO "$BOOT_LOGO" "$BOOT_BINARY"
CREATE_LOGO "$CHARGE_LOGO" "$CHARGE_BINARY"
CREATE_DST_FILE "$BOOT_LOGO" "$CHARGE_LOGO"
CLEANUP
SHOW_COMPLETED

