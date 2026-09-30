FROM docker.io/library/python:3.14.7-slim@sha256:cad9a2c871761c413caa6fdd6441c783451e740a48aaeba60ae62a8b53525ef6 AS base
ENV DEBIAN_FRONTEND=noninteractive
# cache mounts here exist to dogfood standard-build.yaml's
# enable-buildkit-cache-mount-caching input, not because this trivial
# install needs it
# hadolint ignore=DL3008
RUN \
  --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  rm -f /etc/apt/apt.conf.d/docker-clean && \
  echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' >/etc/apt/apt.conf.d/keep-cache && \
  apt-get update && \
  apt-get install -y --no-install-recommends ca-certificates
WORKDIR /app
COPY src/hello_world.py .

FROM base AS test
RUN echo "Hello test"

FROM gcr.io/distroless/python3-debian13:nonroot@sha256:8ee214843129f43e2ebf5e0ca9f2e4e6d8292143d1b8a6787f169b5898578884
WORKDIR /app
# copied from the build context rather than `--from=base`: with the final stage
# depending on base, BuildKit v0.32.2 nondeterministically hung and crashed
# while "preparing build cache for export" (mode=max registry cache).
COPY src/hello_world.py .
USER 65532:65532
# the distroless python image's entrypoint already is the python interpreter
CMD [ "/app/hello_world.py" ]
