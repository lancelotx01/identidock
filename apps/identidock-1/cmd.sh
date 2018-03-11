#!/bin/bash
set -e

if [ "$ENV" == 'DEV' ]; then
  echo "Running Development Environment"
  exec python "identidock_1.py"
elif [ "$ENV" = 'UNIT' ]; then
  echo "Running Unit Tests"
  exec python "test_identidock_1.py"
else
  echo "Running Production Environment"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file identidock_1.py --callable app --stats 0.0.0.0:9191
fi
