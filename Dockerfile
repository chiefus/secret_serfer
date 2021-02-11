FROM python:3.9-alpine

RUN set -ex && apk add --no-cache git bash
COPY . ./
RUN pip install -r requirements.txt

ENTRYPOINT [ "/entrypoint.sh" ]
