#!/bin/bash
set -ex

exec supervisord -c /app/supervisord.conf
