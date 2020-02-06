FROM ubuntu:latest
CMD [sudo su]
RUN apt-get update -y
RUN apt-get install openjdk-8-jre -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install git -y
RUN echo JAVA_HOME=/usr/ >> ~/.bashrc
ADD https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz /tmp
RUN cd /tmp && tar -xvzf apache-tomcat-7.0.77.tar.gz
RUN cd /tmp && mv apache-tomcat-7.0.77 /opt/
EXPOSE 8080
ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /opt/apache-tomcat-7.0.77/webapps/
CMD ["/opt/apache-tomcat-7.0.77/bin/catalina.sh","run"]
