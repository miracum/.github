FROM docker.io/library/python:3.13.0-slim@sha256:4efa69bf17cfbd83a9942e60e2642335c3b397448e00410063a0421f9727c4c4 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:6f47357efced3b45f91d0e951811b6a7b99fa9a9ab8691badef07bbde815c6cc
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
