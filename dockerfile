FROM tomcat
MAINTAINER Vaibhav
RUN apt-get update && apt install maven -y && apt install git -y && mkdir /project && cd /project && git init &&    git clone https://github.com/vaibhavnaikwade21/HostelManagment1.git && cd /project/HostelManagment1 && mvn clean && mvn package && cp /project/HostelManagment1/target/HostelManagementSystem.war /usr/local/tomcat/webapps
