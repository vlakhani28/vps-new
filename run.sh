#!/bin/bash
set -ex

/app/expect_vnc.sh

exec supervisord -c /app/supervisord.conf
