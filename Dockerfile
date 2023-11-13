### BUILD WITH [docker build -t custom-jenkins .]
### RUN WITH [docker run -p 8080:8080 --name custom-jenkins custom-jenkins]

# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="michel.mbem@gmail.com"
LABEL version="0.1"
LABEL description="This is a custom Docker image for Jenkins."

# Switch to the root user account
USER root

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update

# Install all the required packages from ubuntu repository
RUN apt install -y git openjdk-17-jdk-headless ant maven npm wget
RUN rm -rf /var/lib/apt/lists/*
RUN apt clean

# Install jenkins
RUN useradd -m -d /home/jenkins -U -s /bin/false jenkins
RUN wget https://get.jenkins.io/war-stable/2.414.3/jenkins.war -P /usr/share/java
RUN chmod +r /usr/share/java/jenkins.war

# Volume configuration
VOLUME ["/home/jenkins"]

# Switch to the root user account
USER jenkins

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.17.0-openjdk-amd64
ENV JENKINS_HOME /home/jenkins

# Define default command for the container
CMD ["java", "-jar", "/usr/share/java/jenkins.war"]

# Expose Port for the Application 
EXPOSE 8080