FROM docker.io/library/python:3.13.1-slim@sha256:eeb2d1afadeea506d22aa7263e7bbd1b1c8bc8a58841367f0079703f420a94c8 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:66f3e24fd4906156a7360d2861731d31d3457a02f34fd3c4491f0b710a259988
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
