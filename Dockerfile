FROM docker.io/library/python:3.12.6-slim@sha256:15bad989b293be1dd5eb26a87ecacadaee1559f98e29f02bf6d00c8d86129f39 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:fdb3a044d46989e59648dae450d09cd76560013c12947ee4102a416e39621fb9
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
