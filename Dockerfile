FROM docker.io/library/python:3.14.2-slim@sha256:3955a7dd66ccf92b68d0232f7f86d892eaf75255511dc7e98961bdc990dc6c9b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:498e3cb48826d99bad1301994da60caa126b25c0ce03dc4e6a47a7c10fe02493
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
