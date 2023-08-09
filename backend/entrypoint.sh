#!/bin/bash

python manage.py migrate
python manage.py collectstatic
cp -rf /app/collected_static/. /static/static/ 