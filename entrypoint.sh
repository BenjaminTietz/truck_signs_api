#!/usr/bin/env bash
set -e

echo "Waiting for postgres to connect ..."
# wait for postgreQGL Service container: db Port : 5432
while ! nc -z db 5432; do
  sleep 0.1
done

echo "PostgreSQL is active"

python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate

echo "Creating superuser..."

python manage.py createsuperuser --noinput

echo "Postgresql migrations finished – starting Gunicorn..."
# start gunicorn on port 8020
exec gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:8020
