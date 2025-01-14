FROM docker.io/library/python:3.13.0-slim@sha256:0de818129b26ed8f46fd772f540c80e277b67a28229531a1ba0fdacfaed19bcb AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:97c3cd02198dcda447a6c2e2ee06df3d26491e44ef5640c430dc13206d7159c7
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
