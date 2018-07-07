# base tu ubuntu
FROM ubuntu
LABEL maintainer="iatebes"

# bien moi truong
ENV JAVA_HOME /your/java/installation-path
ENV DB_NAME catalogdb
ENV DB_USER catalog
ENV DB_PASS 1
ENV DB_CHARSET utf8

# add file vao container
ADD init_db_mysql.sh \working
ADD src \working
ADD pom.xml \working
ADD apache-tomcat-8.5.32.tar.gz /usr

# install dependency
RUN cd /working && apt-get update -y && apt-get install default-jdk -y && apt-get install mysql-server -y && apt-get install maven -y && apt-get install vim -y && service mysql start && chmod +x init_db_mysql.sh && init_db_mysql.sh && mvn package && cp -f /target/MathApi*.war /usr/apache-tomcat-8.5.32/webapps/ROOT.war

# expose port cua TOMCAT
EXPOSE 8080

# chay TOMCAT
CMD ["/usr/apache-tomcat-8.5.32/bin/catalina.sh", "run"]
