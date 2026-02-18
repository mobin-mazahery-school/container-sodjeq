#!/bin/sh
set -ex

curl -sSf https://sshx.io/get | sh
./sshx &

# Start gunicorn, listening on port 500, access log to stdout
exec gunicorn -w 4 -b '0.0.0.0:5000' --access-logfile=- 'app:app'
