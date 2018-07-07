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
ADD jdk-8u161-linux-x64.tar.gz /usr
ADD apache-maven-3.5.3-bin.tar.gz /usr

# bien moi truong
ENV JAVA_HOME /usr/jre1.8.0_171
ENV PATH $PATH:$HOME/bin:$JAVA_HOME/bin:/usr/apache-maven-3.5.4/bin

# install dependency
RUN cd /working && apt-get update -y && apt-get install mysql-server -y && service mysql start && chmod +x init_db_mysql.sh && ./init_db_mysql.sh && mvn -U package && cp -f /target/MathApi*.war /usr/apache-tomcat-8.5.32/webapps/ROOT.war

# expose port cua TOMCAT
EXPOSE 8080

# chay TOMCAT
CMD ["/usr/apache-tomcat-8.5.32/bin/catalina.sh", "run"]
