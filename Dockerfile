FROM docker.io/library/python:3.13.1-slim@sha256:eeb2d1afadeea506d22aa7263e7bbd1b1c8bc8a58841367f0079703f420a94c8 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:97c3cd02198dcda447a6c2e2ee06df3d26491e44ef5640c430dc13206d7159c7
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
