FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER Daniel Wiltshire

ENV MINECRAFT_VERSION 1.15.1

ADD https://papermc.io/api/v1/paper/${MINECRAFT_VERSION}/latest/download /opt/minecraft/paperclip.jar

RUN apt-get update && apt-get install --no-install-recommends --yes openjdk-11-jre-headless

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /mnt/data

EXPOSE 25565/tcp

ENTRYPOINT java -jar -Xms2G -Xmx2G -Dcom.mojang.eula.agree=true /opt/minecraft/paperclip.jar nogui --noconsole
