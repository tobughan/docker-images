FROM alpine:12
ENV JAVA_VERSION=8u211 \
    JDK_VERSION=1.8.0_211
ENV JAVA_HOME=/opt/jdk$JDK_VERSION
ADD https://jdy-public-downloads.oss-cn-zhangjiakou.aliyuncs.com/jdk/jdk-$JAVA_VERSION-linux-x64.tar.gz /usr/src/
RUN tar -xvf /usr/src/jdk-$JAVA_VERSION-linux-x64.tar.gz -C /opt && \
    rm -f /usr/src/jdk-$JAVA_VERSION-linux-x64.tar.gz && \
    ln -s /opt/jdk$JDK_VERSION/bin/java /usr/bin/java && \
    cd /opt/jdk$JDK_VERSION && \
    find . -type f -name '*.html' -delete && \
    find . -type f -name '*.bat' -delete && \
    find . -type f -name 'COPYRIGHT' -delete && \
    find . -type f -name 'LICENSE' -delete && \
    find . -type f -name 'NOTICE' -delete && \
    find . -type f -name '3RDPARTY' -delete && \
    find . -type f -name 'THIRDPARTYLICENSE.txt' -delete
