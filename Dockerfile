FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER Daniel Wiltshire

RUN apt-get update && \
  apt-get install --no-install-recommends --yes \
  openjdk-11-jre-headless \
  && rm -rf /var/lib/apt/lists/*
