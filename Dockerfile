FROM docker.io/library/python:3.12.4-slim@sha256:a3e58f9399353be051735f09be0316bfdeab571a5c6a24fd78b92df85bcb2d85 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:fdb3a044d46989e59648dae450d09cd76560013c12947ee4102a416e39621fb9
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
