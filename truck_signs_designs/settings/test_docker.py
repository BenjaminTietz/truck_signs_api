import environ
from .base import *
import os

DEBUG = True

env = environ.Env()
# reading env file
environ.Env.read_env('/app/.env')

SECRET_KEY = env("DOCKER_SECRET_KEY", default="dummy-secret")
DEBUG = True

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
]



DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': env('DOCKER_DB_NAME'),
        'USER': env('DOCKER_DB_USER'),
        'PASSWORD': env('DOCKER_DB_PASSWORD'),
        'HOST': env('DOCKER_DB_HOST'),
        'PORT': env('DOCKER_DB_PORT'),
    }
}

STRIPE_PUBLISHABLE_KEY=env("DOCKER_STRIPE_PUBLISHABLE_KEY")
STRIPE_SECRET_KEY=env("DOCKER_STRIPE_SECRET_KEY")



EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = env("DOCKER_EMAIL_HOST_USER")
EMAIL_HOST_PASSWORD = env("DOCKER_EMAIL_HOST_PASSWORD")

STATIC_URL = '/static/'
STATIC_ROOT = env('DJANGO_STATIC_ROOT', default='/app/static')

MEDIA_URL = '/media/'
MEDIA_ROOT = env('DJANGO_MEDIA_ROOT', default='/app/media')