#!/bin/sh

# https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example
trap "echo TRAPed signal" HUP INT QUIT TERM

/4store/bin/4s-backend -D default &
backend_pid=$(pidof 4s-backend)
/4store/bin/4s-httpd -D default

echo "killing backend"
kill -TERM $backend_pid

echo "exited"

