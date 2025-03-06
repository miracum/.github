FROM docker.io/library/python:3.13.1-slim@sha256:031ebf3cde9f3719d2db385233bcb18df5162038e9cda20e64e08f49f4b47a2f AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:97c3cd02198dcda447a6c2e2ee06df3d26491e44ef5640c430dc13206d7159c7
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
