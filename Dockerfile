FROM alpine:latest

RUN apk add --no-cache postgresql-client

ARG PUID=1000
ARG PGID=1000

RUN \
  addgroup -g "${PGID}" postgresql-client && \
  adduser \
    -u "${PUID}" \
    -G postgresql-client \
    -h /postgresql-client \
    -D \
    postgresql-client

WORKDIR /postgresql-client

USER postgresql-client

ENTRYPOINT ["echo","$POSTGRES_URI"]
#ENTRYPOINT ["psql","$POSTGRES_URI","-c","$POSTGRES_COMMAND"]
