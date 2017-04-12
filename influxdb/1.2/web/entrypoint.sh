#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- influx-enterprise "$@"
fi

exec "$@"
