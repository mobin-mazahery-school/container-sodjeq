# syntax=docker/dockerfile:1
FROM python:3-bookworm
ENV PYTHONUNBUFFERED=1
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app/
RUN apt install g++ curl
RUN pip install -U -r requirements.txt
COPY ./web /usr/src/app/
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
