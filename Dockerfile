FROM alpine:latest

RUN apk add --no-cache tzdata build-base python3 python3-dev py3-virtualenv ipmitool lm-sensors lm-sensors-dev git

WORKDIR /fancontroller

RUN git clone --branch docker https://github.com/MainFighter/r710-fan-controller.git /fancontroller
RUN bash /fancontroller/install.sh

ENTRYPOINT ["/fancontroller/venv/bin/python3", "-u", "/fancontroller/fan_control.py", "--config", "/fancontroller/fan_control.yaml"]