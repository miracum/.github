FROM docker.io/library/python:3.12.4-slim@sha256:d5f16749562233aa4bd26538771d76bf0dfd0a0ea7ea8771985e267451397ae4 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:fdb3a044d46989e59648dae450d09cd76560013c12947ee4102a416e39621fb9
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
