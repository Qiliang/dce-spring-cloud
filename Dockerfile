FROM openjdk:8-jdk

LABEL maintainer "qiliang.xiao@daocloud.io"

COPY dce-app-entrypoint /work/dce-app-entrypoint
RUN chmod a+x /work/dce-app-entrypoint

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone


WORKDIR /work/
ENV DAE_NETWORK='port'
ENV DAE_SEGMENT='^172\.17\.\d{1,3}.\d{1,3}$'

ENTRYPOINT ["/work/dce-app-entrypoint"]
