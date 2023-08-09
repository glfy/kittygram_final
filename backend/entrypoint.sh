#!/bin/bash

python manage.py migrate --noinput
python manage.py collectstatic --noinput
rm -rf /static/static/
cp -r /app/collected_static/. /static/static/
