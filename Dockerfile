FROM docker.io/library/python:3.12.4-slim@sha256:44fa7d815050f3dc43b1d5d50c3f4d19870a83c96301c9653e8cf908ccd7892b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:14c62b8925d3bb30319de2f346bde203fe18103a68898284a62db9d4aa54c794
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
