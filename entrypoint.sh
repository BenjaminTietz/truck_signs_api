#!/usr/bin/env bash
set -e

echo "Waiting for postgres to connect ..."
# wait fpr postgreQGL Service contrainder: db Port : 5432
while ! nc -z db 5432; do
  sleep 0.1
done

echo "PostgreSQL is active"

python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate

echo "Creating superuser if not exists..."

python manage.py shell -c "
from django.contrib.auth import get_user_model;
import os;
User = get_user_model();
username = os.environ.get('DJANGO_SUPERUSER_USERNAME');
email = os.environ.get('DJANGO_SUPERUSER_EMAIL');
password = os.environ.get('DJANGO_SUPERUSER_PASSWORD');
if username and not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username, email, password)
    print('Superuser created');
else:
    print('Superuser already exists or username is missing');
"


echo "Postgresql migrations finished – starting Gunicorn..."
# start gunicorn on port 8020
exec gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:8020
