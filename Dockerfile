FROM python:3.11-slim

RUN mkdir -p /deploy/app

COPY requirements.txt /deploy/
RUN pip install --no-cache-dir -r /deploy/requirements.txt

WORKDIR /deploy/app
COPY . /deploy/

EXPOSE 5000

CMD ["gunicorn", "--config", "/deploy/gunicorn_config.py", "server:app"]
