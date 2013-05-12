#!/bin/bash

count=5
pid=0

while [[ $count -gt 0 ]]; do
	read -r pid < ~/.offlineimap/pid

	if ps $pid &>/dev/null; then
		echo "offlineimap ($pid): another instance running." >&2
		count=$((count - 1))
		sleep 5
		continue
	fi

	break
done
kill -9 $pid &>/dev/null

offlineimap -o -u quiet &
