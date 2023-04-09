FROM ydkn/cups:latest

ARG VCS_REF
ARG BUILD_DATE

# labels
LABEL maintainer="Jeffrey Neer <github@jeffreyneer.com>" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="ffejhog/cups-hrltSL42" \
  org.label-schema.description="Simple CUPS docker image with the HRLT SL42 driver installed" \
  org.label-schema.version="0.1" \
  org.label-schema.url="https://hub.docker.com/r/ydkn/cups" \
  org.label-schema.vcs-url="https://github.com/ffejhog/docker-cups-hrltsl42" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.build-date=$BUILD_DATE

RUN apt-get update && apt-get install -y \
  wget unzip

RUN cd ~

RUN wget -O driver.zip https://www.hprt.com/upload/files/hprt_sl42_label_printer_linux_driver_v1.4.0.zip

RUN unzip driver.zip

RUN cd hprt_sl42_label_printer_linux_driver_v1.4.0/hprt_sl42_label_printer_linux_driver_v1.4.0/ \
  && ls && chmod +x install && ./install
