# Dockerfile for the creation of a custom Jenkins image

### Docker commands

For building:
```sh
docker build -t custom-jenkins .
```

For running:
```sh
docker run -p 8080:8080 --name jenkins custom-jenkins
```

### Interface

The image exposes the **8080** TCP port for Jenkins.

The `/home/jenkins` directory is persisted as a volume.

### Included packages

The following packages are included in this image:

* git
* openjdk-17-jdk-headless
* ant
* maven
* npm
* wget
* ssh-client
* build-essentials

### Deployment via SSH

If a job running on a container created from this image has to deploy via SSH, a SSH key pair should first be generated in the container and shared with the SSH server.