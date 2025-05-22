FROM docker.io/library/python:3.13.3-slim@sha256:56a11364ffe0fee3bd60af6d6d5209eba8a99c2c16dc4c7c5861dc06261503cc AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:4f8b42850389c3d3fc274df755d956448b81d4996d5328551893070e16616f1c
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
