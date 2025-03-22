import os

env_setting = os.environ.get('DJANGO_SETTINGS_MODULE_MODE', 'test_docker')

if env_setting == 'production':
    from .production import *
elif env_setting == 'dev':
    from .dev import *
else:
    from .test_docker import *