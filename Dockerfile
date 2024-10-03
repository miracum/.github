FROM docker.io/library/python:3.12.7-slim@sha256:af4e85f1cac90dd3771e47292ea7c8a9830abfabbe4faa5c53f158854c2e819d AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:60a4160404e92c4e5639166c303cca6f5081e1110a09261aeaec38d36f539c6d
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
