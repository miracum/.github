FROM docker.io/library/python:3.12.2-slim@sha256:56c0b10956447a1423aea94df570cdbdc147e51692e7f9468728e9a020a8737c AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:02c3a74bee78c927ab39dd739f0e56e36675e6adc9032208abb7ed8b83067c74
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
