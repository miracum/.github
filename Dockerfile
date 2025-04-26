FROM docker.io/library/python:3.13.2-slim@sha256:f3614d98f38b0525d670f287b0474385952e28eb43016655dd003d0e28cf8652 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:b0ae47130fa7633d6599a320610230310ff5126307e3a3a6acf7de3fd6931f94
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
