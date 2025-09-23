FROM docker.io/library/python:3.13.7-slim@sha256:58c30f5bfaa718b5803a53393190b9c68bd517c44c6c94c1b6c8c172bcfad040 AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:d0f0f30dca9d4b574e7915ff6eb13d93c71bc4aa3f53dea66d54f2eabe813514
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
