FROM docker.io/library/python:3.14.0-slim@sha256:5cfac249393fa6c7ebacaf0027a1e127026745e603908b226baa784c52b9d99b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:1a7c3d2445f783c51be174c8913624dc5bea2cd7ff1f94b9a229a16f0e40fa34
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
