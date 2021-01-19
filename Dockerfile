FROM python:3.9-slim

# Install git (required by ansible-lint)
RUN set -ex && apt-get update && apt-get -q install -y -V git && rm -rf /var/lib/apt/lists/*
COPY . ./
RUN pip install -r requirements.txt

#COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
#CMD ["trufflehog3", "--no-history", "-r", "/rules.yaml", "/github/workspace"]