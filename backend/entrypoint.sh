#!/bin/bash

sudo docker-compose -f docker-compose.production.yml exec backend python manage.py migrate
sudo docker-compose -f docker-compose.production.yml exec backend python manage.py collectstatic
sudo docker-compose -f docker-compose.production.yml exec backend cp -r /app/collected_static/. /static/static/
