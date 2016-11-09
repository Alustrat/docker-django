FROM python:latest
ENV PYTHONUNBUFFERED 1

# Create working folders
RUN mkdir /code \
  /code/www
WORKDIR /code

# Install and create virtualenv
RUN pip install virtualenv \
  && virtualenv env

# Install Django and other dependencies in the virtualenv
ADD requirements.txt /code/env/
RUN ["/bin/bash", "-c", "source /code/env/bin/activate && pip install --upgrade pip && pip install -r env/requirements.txt"]