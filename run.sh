#!/bin/bash
set -ex

bash /app/expect_vnc.sh
vncserver -kill :1

exec supervisord -c /app/supervisord.conf
