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

And now you can access to django from your browser at *docker_container_IP:8000* !