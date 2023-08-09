python manage.py migrate
python manage.py collectstatic
cp -r /app/collected_static/. /static/static/ 