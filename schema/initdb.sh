#!/bin/bash

cd /app/schema

DATABASE="postgresql://${PGUSER:-postgres}:${PGPASSWORD:-postgres}@${PGHOST:-localhost}/${PGDATABASE:-postgres}"

yoyo apply --database=$DATABASE ./importjobs