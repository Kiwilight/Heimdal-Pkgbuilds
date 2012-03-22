#! /bin/bash

### /etc/rc.d/kadmind: Initscript for Heimdal kadmind

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/kadmind

PID=`pidof -o %PPID /usr/sbin/kadmind`

case "$1" in
  start)
    stat_busy 'Starting Heimdal kadmind'
    [ -z "$PID" ] && /usr/sbin/kadmind \
      $KADMIND_OPTION & &> /dev/null
    if [ $? -gt 0 ]; then stat_fail
    else stat_done; add_daemon kadmind
      echo $PID > /run/kadmind.pid; fi ;;
  stop)
    stat_busy 'Stopping Heimdal kadmind'
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then stat_fail
    else stat_done; rm_daemon kadmind fi ;;
  restart) $0 stop; sleep 1; $0 start ;;
  *) echo "Usage: $0 start|stop|restart"
esac

exit 0

## vim: ft=sh
### /etc/rc.d/kadmind: Initscript for Heimdal kadmind
