# base tu ubuntu
FROM ubuntu
LABEL maintainer="iatebes"

# bien moi truong
ENV DB_NAME catalogdb
ENV DB_USER catalog
ENV DB_PASS 1
ENV DB_CHARSET utf8

# add file vao container
ADD . /working
ADD apache-tomcat-8.5.32.tar.gz /usr
ADD apache-maven-3.5.4-bin.tar.gz /usr

# bien moi truong
ENV PATH $PATH:$HOME/bin:/usr/apache-maven-3.5.4/bin

# install dependency
RUN cd /working && \
    apt-get update -y && \
    apt-get install -y software-properties-common && \
    apt-get update -y && \
    add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get install openjdk-8-jdk -y && \
    apt-get install mysql-server -y && \
    service mysql start && \
    chmod +x init_db_mysql.sh && \
    chmod +x start.sh && \
    ./init_db_mysql.sh && \
    mvn -U package && \
    rm -R -f /usr/apache-tomcat-8.5.32/webapps/ROOT && \
    cp -f ./target/MathApi*.war /usr/apache-tomcat-8.5.32/webapps/ROOT.war

# expose port cua TOMCAT
EXPOSE 8080

# chay TOMCAT
ENTRYPOINT ["/working/start.sh"]
