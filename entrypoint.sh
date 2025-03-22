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

# Create superuser if it doesn't exist
echo "Creating superuser if not exists..."
python manage.py shell << END
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username="${DJANGO_SUPERUSER_USERNAME}").exists():
    User.objects.create_superuser(
        "${DJANGO_SUPERUSER_USERNAME}",
        "${DJANGO_SUPERUSER_EMAIL}",
        "${DJANGO_SUPERUSER_PASSWORD}"
    )
END



echo "Postgresql migrations finished – starting Gunicorn..."
# start gunicorn on port 8020
exec gunicorn truck_signs_designs.wsgi:application --bind 0.0.0.0:8020
