FROM docker.io/library/python:3.12.1-slim@sha256:db7e9284d53f7b827c58a6239b9d2907c33250215823b1cdb7d1e983e70dafa5 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:27d2d6afcfb109e4c147449d4af957f71cb770196527d0da1d1d92b9680b0daa
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
