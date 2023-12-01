FROM docker.io/library/python:3.12.0-slim@sha256:eb6d3208444a54418be98f83f1006f6d78ef17144f1cd9eb4e5945d4851af355 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:39cc901d176eee5ebd44a047cd195acd907d57baee66f67236d08fdc8da6703b
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
