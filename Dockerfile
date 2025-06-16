FROM docker.io/library/python:3.13.5-slim@sha256:f2fdaec50160418e0c2867ba3e254755edd067171725886d5d303fd7057bbf81 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:b34be7bbfb23377f7600f53c7110df970fdd50d2e57aad7091e45056f7907eaf
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
