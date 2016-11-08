FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
RUN mkdir /code/www
WORKDIR /code
RUN pip install virtualenv
RUN virtualenv env
ADD requirements.txt /code/env/
RUN ["/bin/bash", "-c", "source /code/env/bin/activate && pip install --upgrade pip && pip install -r env/requirements.txt"]