FROM alpine:3.11
ENV JAVA_VERSION=8u251 \
    JDK_VERSION=1.8.0_251 \
    GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc \
    GLIBC_VERSION=2.31-r0 \
    JAVA_HOME=/opt/jdk \
    PATH=$PATH:/opt/jdk/bin
RUN set -ex && \
    echo http://mirrors.aliyun.com/alpine/v3.11/main >/etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.11/community >>/etc/apk/repositories && \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION}; do wget ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -O /tmp/${pkg}.apk; done && \
    apk add --no-cache --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib && \
    apk del glibc-bin && \
    mkdir -p /opt && \
    wget -O /opt/jdk-$JAVA_VERSION-linux-x64.tar.gz https://jdy-public-downloads.oss-cn-zhangjiakou.aliyuncs.com/jdk/jdk-$JAVA_VERSION-linux-x64.tar.gz && \
    tar -xvf /opt/jdk-$JAVA_VERSION-linux-x64.tar.gz -C /opt && \
    rm -f /opt/jdk-$JAVA_VERSION-linux-x64.tar.gz && \
    ln -s /opt/jdk$JDK_VERSION $JAVA_HOME && \
    rm -vrf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/bin/jjs \
           /opt/jdk/jre/bin/orbd \
           /opt/jdk/jre/bin/pack200 \
           /opt/jdk/jre/bin/policytool \
           /opt/jdk/jre/bin/rmid \
           /opt/jdk/jre/bin/rmiregistry \
           /opt/jdk/jre/bin/servertool \
           /opt/jdk/jre/bin/tnameserv \
           /opt/jdk/jre/bin/unpack200 \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/lib/ext/nashorn.jar \
           /opt/jdk/jre/lib/oblique-fonts \
           /opt/jdk/jre/lib/plugin.jar
