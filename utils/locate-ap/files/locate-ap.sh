#!/bin/sh

. /etc/diag.sh

PID_FILE="/tmp/.locate_ap_pid"

status_led="$running"


blink_status() {
	local duration=$1
	led_timer $status_led 250 250
}

restore_status() {
	sleep $1
	[ -f "$PID_FILE" ] && status_led_on
	rm -f "$PID_FILE"
}

start_locate() {
	blink_status

	if [ -n "$1" ]; then
		restore_status "$1" &
		PID=$!
		echo "$PID" > "$PID_FILE"
	fi
}

stop_locate() {
	[ -f "$PID_FILE" ] && kill "$(cat "$PID_FILE")"
	restore_status "0"
}

if [ "$1" == "stop" ]; then
	stop_locate
else
	if [ -f "$PID_FILE" ]; then
		stop_locate
	fi
	start_locate "$1"
	if [ -z "$1" ]; then
		echo "Device will locate indefinitely. Use \"$0 stop\" to stop locating."
	else
		echo "Device will locate for $1 seconds. Use \"$0 stop\" to stop locating."
	fi
fi
