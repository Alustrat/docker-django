Starter nginx / django / postgresql
===================

Docker project to have a starter for django projects. The project use 3 containers which all starts from an official container. There is the nginx container, the django container and finally the postgresql container.

This project is still in work so i don't recommend to use it now.

Django container configuration
-------------

All the code is available in the /code directory, and look like this :

```
code
 |---->env
 |     |---->bin
 |     `---->lib
 `---->www
       |---->manage.py
       |----->mysite
       `----->myapp
```

Download and use
-------------

After cloned it, you just have to write these 2 commands :
```
docker-compose run -d web /bin/bash -c "source /code/env/bin/activate; django-admin startproject mysite ./www"
docker-compose up
```

In settings.py, don't forget to modify theses :
```
ALLOWED_HOSTS = ['10.0.75.1']
```
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```
```
STATIC_URL = '/static/'
MEDIA_URL = '/media/'

STATIC_ROOT = '/static'
MEDIA_ROOT = '/media'
```

By default, it's lauch as 'dev' mode, with no link between nginx and your django project. The site is only launched by 'python manage.py runserver' at port 8000. The goal of this is to directly have changes visible.

If you want to put it in production mode, comment docker-compose.yml line 9 and uncomment line 10. This will start uwsgi to communicate with nginx. Your site will be available at port 80.