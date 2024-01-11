FROM docker.io/library/python:3.12.1-slim@sha256:ee9a59cfdad294560241c9a8c8e40034f165feb4af7088c1479c2cdd84aafbed AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:27d2d6afcfb109e4c147449d4af957f71cb770196527d0da1d1d92b9680b0daa
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
