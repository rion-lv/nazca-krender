FROM centos:7
ARG ACTIVE_PROFILES
RUN echo $ACTIVE_PROFILES
MAINTAINER danni.took
USER root
ENV TZ Asia/Seoul
ENV LANG en_US.UTF-8
RUN yum -y install wget
RUN yum -y install net-tools
RUN yum -y install java
RUN mkdir -p /levvels
RUN mkdir -p /levvels/web
RUN mkdir -p /levvels/build
ADD . /levvels/build
WORKDIR /levvels/build/build/libs
RUN cp nazca-render.jar /levvels/web
WORKDIR /levvels/web
