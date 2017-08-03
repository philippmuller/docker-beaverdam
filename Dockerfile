# beaverdam-simple

FROM ubuntu:latest
MAINTAINER Philipp Müller <mailphilippmuller@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-virtualenv nginx gunicorn supervisor libpq-dev python3-dev python3 python3-pip build-essential wget

# Setup flask application
RUN mkdir -p /deploy/app
COPY BeaverDam /deploy/app
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade -r /deploy/app/requirements.txt

# RUN /deploy/app/scripts/setup
RUN /deploy/app/scripts/seed -f

# Start processes
WORKDIR "/deploy/app/"
#CMD ["./manage.py runserver '0.0.0.0:5000'"]
