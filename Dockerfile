FROM rocker/tidyverse:3.6.0

RUN set -x && \
  apt-get update && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

RUN set -x && \
  install2.r \
    conflicted \
    here \
    xaringan \
    recipes \
    textrecipes && \
  installGithub.r \
    "hadley/emo" && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
