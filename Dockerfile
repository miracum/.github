FROM docker.io/library/python:3.12.6-slim@sha256:ad48727987b259854d52241fac3bc633574364867b8e20aec305e6e7f4028b26 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:60a4160404e92c4e5639166c303cca6f5081e1110a09261aeaec38d36f539c6d
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
