#!/bin/bash

LOGFILE=/var/log/mailrun/mailrun.log
RETAIN_NUM_LINES=500

function logsetup {
    TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && echo "${TMP}" > $LOGFILE
    exec > >(tee -a $LOGFILE)
    exec 2>&1
}

function log {
    echo "[$(date)]: $*"
}

logsetup

if ps -ef | grep -v grep | grep mbsync ; then
	echo "mbsync already running. exiting."
	exit 0
fi

/usr/local/bin/mbsync -q -V -a
