FROM docker.io/library/python:3.14.0-slim@sha256:5cfac249393fa6c7ebacaf0027a1e127026745e603908b226baa784c52b9d99b AS base
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian12:nonroot@sha256:d0f0f30dca9d4b574e7915ff6eb13d93c71bc4aa3f53dea66d54f2eabe813514
USER 65532:65532
CMD [ "python", "/app/hello_world.py" ]
