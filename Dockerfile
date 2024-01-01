FROM docker.io/library/python:3.12.0-slim@sha256:19a6235339a74eca01227b03629f63b6f5020abc21142436eced6ec3a9839a76 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:27d2d6afcfb109e4c147449d4af957f71cb770196527d0da1d1d92b9680b0daa
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
