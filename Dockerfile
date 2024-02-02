FROM docker.io/library/python:3.12.1-slim@sha256:db7e9284d53f7b827c58a6239b9d2907c33250215823b1cdb7d1e983e70dafa5 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:02c3a74bee78c927ab39dd739f0e56e36675e6adc9032208abb7ed8b83067c74
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
