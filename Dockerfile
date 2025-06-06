FROM docker.io/library/python:3.13.4-slim@sha256:d97b595c5f4ac718102e5a5a91adaf04b22e852961a698411637c718d45867c8 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:4f8b42850389c3d3fc274df755d956448b81d4996d5328551893070e16616f1c
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
