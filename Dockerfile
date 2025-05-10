FROM docker.io/library/python:3.13.3-slim@sha256:914bf5c12ea40a97a78b2bff97fbdb766cc36ec903bfb4358faf2b74d73b555b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:b0ae47130fa7633d6599a320610230310ff5126307e3a3a6acf7de3fd6931f94
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
