FROM docker.io/library/python:3.14.0-slim@sha256:4ed33101ee7ec299041cc41dd268dae17031184be94384b1ce7936dc4e5dead3 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:1a7c3d2445f783c51be174c8913624dc5bea2cd7ff1f94b9a229a16f0e40fa34
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
