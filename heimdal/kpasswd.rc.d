#! /bin/bash

### /etc/rc.d/kpasswd: Initscript for Heimdal kpasswd

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/kpasswd

PID=`pidof -o %PPID /usr/sbin/kpasswdd`

case "$1" in
  start)
    stat_busy 'Starting Heimdal kpasswd'
    [ -z "$PID" ] && /usr/sbin/kpasswdd \
      $KADMIND_OPTION & &> /dev/null
    if [ $? -gt 0 ]; then stat_fail
    else stat_done; add_daemon kpasswd
      echo $PID > /run/kpasswd.pid; fi ;;
  stop)
    stat_busy 'Stopping Heimdal kpasswd'
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then stat_fail
    else stat_done; rm_daemon kpasswd fi ;;
  restart) $0 stop; sleep 1; $0 start ;;
  *) echo "Usage: $0 start|stop|restart"
esac

exit 0

## vim: ft=sh
### /etc/rc.d/kpasswd: Initscript for Heimdal kpasswd
