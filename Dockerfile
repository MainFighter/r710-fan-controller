FROM alpine:latest

RUN apk add --no-cache tzdata build-base python3 python3-dev py3-virtualenv ipmitool lm-sensors lm-sensors-dev git

WORKDIR /fancontroller

RUN git clone --branch docker https://github.com/MainFighter/r710-fan-controller.git /fancontroller
RUN bash /fancontroller/install.sh

CMD ["[ ! -f '/fancontroller/config/fan_control.yml' ] && cp /fancontroller/fan_control.yaml /fancontroller/config/fan_control.yaml"]
ENTRYPOINT ["/fancontroller/venv/bin/python3", "-u", "/fancontroller/fan_control.py", "--config", "/fancontroller/config/fan_control.yaml"]
#ENTRYPOINT ["/bin/bash", "/fancontroller/run.sh"]