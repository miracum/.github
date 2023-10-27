FROM docker.io/library/python:3.12.0-slim@sha256:babc0d450bf9ed2b369814bc2f466e53a6ea43f1201f6df4e7988751f755c52c AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:39cc901d176eee5ebd44a047cd195acd907d57baee66f67236d08fdc8da6703b
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
