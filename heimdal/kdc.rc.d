#! /bin/bash

### /etc/rc.d/kdc: Initscript for Heimdal KDC

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/kdc`

case "$1" in
  start)
    stat_busy 'Starting Heimdal KDC'
    [ -z "$PID" ] && \
      /usr/sbin/kdc --detach &> /dev/null
    if [ $? -gt 0 ]; then stat_fail
    else stat_done; add_daemon kdc
      echo $PID > /run/kdc.pid; fi ;;
  stop)
    stat_busy 'Stopping Heimdal KDC'
    [ ! -z "$PID" ] \
      && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then stat_fail
    else stat_done; rm_daemon kdc; fi ;;
  restart) $0 stop; sleep 1; $0 start ;;
  *) echo "Usage: $0 start|stop|restart"
esac

exit 0

## vim: ft=sh
### /etc/rc.d/kdc: Initscript for Heimdal KDC
