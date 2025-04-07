from .base import *

DEBUG = False
SECRET_KEY= os.environ["SECRET_KEY"]

# db_from_env = dj_database_url.config()
# DATABASES["default"].update(db_from_env)

DEBUG = env.bool("DEBUG", default=False)


CORS_ALLOWED_ORIGINS = [
    "https://truck-signs-frontend-nextjs-4f1tbf3c3-ceci-aguilera.vercel.app",
    "https://truck-signs-frontend-nextjs.vercel.app",
    "https://truck-signs-frontend-nextjs-git-vercelpre-ceci-aguilera.vercel.app",
]

CLOUDINARY_STORAGE = {
    'CLOUD_NAME': os.environ['CLOUD_NAME'],
    'API_KEY': os.environ['CLOUD_API_KEY'],
    'API_SECRET': os.environ['CLOUD_API_SECRET'],
}

DEFAULT_FILE_STORAGE = 'cloudinary_storage.storage.MediaCloudinaryStorage'

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

STRIPE_PUBLISHABLE_KEY=os.environ["STRIPE_PUBLISHABLE_KEY"]
STRIPE_SECRET_KEY=os.environ["STRIPE_SECRET_KEY"]

CURRENT_ADMIN_DOMAIN = os.environ["CURRENT_ADMIN_DOMAIN"]

EMAIL_ADMIN = os.environ["EMAIL_ADMIN"]

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = os.environ["EMAIL_HOST_USER"]
EMAIL_HOST_PASSWORD = os.environ["EMAIL_HOST_PASSWORD"]
