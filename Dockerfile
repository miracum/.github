FROM docker.io/library/python:3.13.7-slim@sha256:27f90d79cc85e9b7b2560063ef44fa0e9eaae7a7c3f5a9f74563065c5477cc24 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:b34be7bbfb23377f7600f53c7110df970fdd50d2e57aad7091e45056f7907eaf
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
