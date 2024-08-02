FROM docker.io/library/python:3.12.4-slim@sha256:1ef6f4d9c85f879bbda6d437048fc23ec4927452e90354bb754f26728a05021b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:fdb3a044d46989e59648dae450d09cd76560013c12947ee4102a416e39621fb9
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
