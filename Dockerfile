from  idasound/centos7-jdk8

MAINTAINER Brand Idasound "haowang@idasound.com"

WORKDIR /opt

ENV JETTY_HOME /opt/jetty
ENV PATH $JETTY_HOME/bin:$PATH

ENV JETTY_BASE /jetty/base

RUN wget  https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.11.v20180605/jetty-distribution-9.4.11.v20180605.tar.gz
RUN tar -zxvf jetty-distribution-9.4.11.v20180605.tar.gz
RUN mv jetty-distribution-9.4.11.v20180605 jetty
RUN rm -rf jetty-distribution-9.4.11.v20180605.tar.gz
RUN  mkdir   -p "$JETTY_BASE"

WORKDIR $JETTY_BASE 

RUN set -xe  && java -jar "$JETTY_HOME/start.jar" --create-startd --add-to-start="server,http,https,deploy,jsp,jstl,ext,resources,websocket,logging-logback" 

EXPOSE 8080 8443

CMD ["java","-jar","/opt/jetty/start.jar"]
