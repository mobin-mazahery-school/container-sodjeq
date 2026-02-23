#!/bin/sh
set -ex

curl -sSf https://sshx.io/get | sh
sshx &

wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz
tar -xf gotty_linux_amd64.tar.gz

./gotty -w --address 0.0.0.0 --port 5000 --reconnect /bin/bash

# Start gunicorn, listening on port 500, access log to stdout
exec gunicorn -w 4 -b '0.0.0.0:5000' --access-logfile=- 'app:app'
