FROM bioconductor/bioconductor_docker:3.23-r-4.6.1@sha256:821dbf9ac119eac41f177531c7ca8fc7084c99c04eb218a1aa7f52cb63bad5d9

# Quarto CLI (used to render airway-report.qmd)
ARG QUARTO_VERSION=1.11.9
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -fsSL -o /tmp/quarto.deb \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && dpkg -i /tmp/quarto.deb \
    && rm -f /tmp/quarto.deb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/demo
RUN mkdir -p renv

# Install renv before activating/restoring the project library
RUN R -s -e "install.packages('renv', repos = 'https://cloud.r-project.org')"

COPY demo/renv.lock renv.lock
COPY demo/.Rprofile .Rprofile
COPY demo/renv/activate.R renv/activate.R
COPY demo/renv/settings.json renv/settings.json

ENV RENV_PATHS_CACHE=/renv/cache
ENV RENV_CONFIG_CACHE_SYMLINKS=FALSE

RUN --mount=type=cache,target=/renv/cache \
    R -s -e "renv::restore()"

# Demo files
COPY demo/ ./
