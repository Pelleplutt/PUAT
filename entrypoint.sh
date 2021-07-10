#!/bin/bash

if [ -v INIT_DB ]; then
    echo "- INIT DB -----------------------------------------------------------"
    schema/initdb.sh
    echo "- INIT DB DONE ------------------------------------------------------"
elif [ -v UPGRADE_DB ]; then
    schema/upgradedb.sh
fi

exec /usr/local/bin/gunicorn --bind :5000 --access-logfile - --error-logfile - --capture-output puat_wsgi:app