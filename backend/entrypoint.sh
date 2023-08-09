#!/bin/bash

python manage.py migrate --noinput
python manage.py collectstatic --noinput
cp -rn /app/collected_static/. /static/static/
