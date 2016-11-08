Starter nginx / django /postresql
===================


Starter to works on django projects on docker containers. Run with or without nginx and rely with a postgresql database. Of course with a virtualenvironment too !

----------


In works !
-------------

Hi, at this time, this project is still in work. There is just the django container which i work on. Next step is to relate with nginx and after that with postgresql. 

Django : How it's look ?
-------------

Istart from the basic last python container but maybe latter I will use the alpine version. We create the /code container wich will contain our django app and our environment. The arborescence look like this :
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

But how to start it ?
-------------

It's easy man ! After cloned it, you just have to write 3 commands :
```
docker-compose build --no-cache
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

And all is good in a the better of the world.


WTF this english ?
-------------
If you see all of this. I just created that project and it's late, so i made this markdown really fast. This will be corrected tomorrow.