#!/bin/bash
set -ex

bash /app/expect_vnc.sh
exec supervisord -c /app/supervisord.conf
