FROM java:8

MAINTAINER EMCDotNextTeam

RUN  mkdir /data 

EXPOSE 25565 25575


COPY start-minecraft.sh /start-minecraft
# RUN chmod +x /usr/local/bin/*

# VOLUME ["/data"] - Maybe Rex-Rey command in the future

WORKDIR /data

ENTRYPOINT [ "/start-minecraft" ]


