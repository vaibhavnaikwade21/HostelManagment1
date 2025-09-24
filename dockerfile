FROM tomcat:latest
MAINTAINER Vaibhav

# Install required tools
RUN apt-get update && apt-get install -y maven git

# Build the project from GitHub
RUN mkdir /project && \
    cd /project && \
    git clone https://github.com/vaibhavnaikwade21/HostelManagment1.git && \
    cd /project/HostelManagment1 && \
    mvn clean package

# Copy the WAR file as ROOT.war so it's deployed at /
RUN cp /project/HostelManagment1/target/HostelManagementSystem.war /usr/local/tomcat/webapps/ROOT.war
