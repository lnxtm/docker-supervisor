FROM debian:testing
MAINTAINER Alexander Shevchenko <kudato@me.com>

ENV DEBIAN_FRONTEND noninteractive

ENV EMAIL kudato@me.com

ENV GIT_USER nosetuser
ENV GIT_PASS nosetpass

ENV REPO external
ENV BRANCH master

RUN ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    mv /etc/localtime  /etc/localtime-old && \
    apt-get update && apt-get -y upgrade && apt-get install -y supervisor locales git curl nano && \
    localedef ru_RU.UTF-8 -i ru_RU -fUTF-8 && \
    touch /etc/supervisor/conf.d/supervisord.conf && \
    echo "[supervisord]" >> /etc/supervisor/conf.d/supervisord.conf && \
    echo "nodaemon=true" >> /etc/supervisor/conf.d/supervisord.conf && \
    apt-get clean && git config --global user.name "$GIT_USER" && \
    git config --global user.email "$EMAIL"