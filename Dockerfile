FROM docker.io/library/python:3.14.2-slim@sha256:d517cd31ec21949a453d42c6f2006e6fccdeca986aeb3dd61f85485fefcb299b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:17b27c84c985a53d0cd2adef4f196ca327fa9b6755369be605cf45533b4e700b
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
