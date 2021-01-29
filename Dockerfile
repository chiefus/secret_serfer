FROM python:3.9-slim

RUN set -ex && apt-get update && apt-get -q install -y -V git && rm -rf /var/lib/apt/lists/*
COPY . ./
RUN pip install -r requirements.txt

ENTRYPOINT [ "/entrypoint.sh" ]
