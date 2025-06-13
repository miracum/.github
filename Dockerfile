FROM docker.io/library/python:3.13.5-slim@sha256:f2fdaec50160418e0c2867ba3e254755edd067171725886d5d303fd7057bbf81 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:4f8b42850389c3d3fc274df755d956448b81d4996d5328551893070e16616f1c
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
