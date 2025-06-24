FROM python:3.6-alpine

RUN mkdir -p /deploy/app

COPY requirements.txt /deploy/
RUN apt --update add --virtual build-base \
  && python3 -m ensurepip \
  && pip install --upgrade pip \
  && pip install --no-cache-dir -r /deploy/requirements.txt

WORKDIR /deploy/app
COPY . /deploy/

EXPOSE 5000

CMD ["gunicorn", "--config", "/deploy/gunicorn_config.py", "server:app"]
