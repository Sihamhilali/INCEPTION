## What is Docker?

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker's methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.

## What can I use Docker for?

- Your developers write code locally and share their work with their colleagues using Docker containers.
- They use Docker to push their applications into a test environment and run automated and manual tests.
- When developers find bugs, they can fix them in the development environment and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as pushing the updated image to the production environment.

## Docker architecture?

Docker uses a client-server architecture. The Docker client talks to the Docker <u>daemon</u>, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and <u>daemon</u> can run on the same system, or you can connect a Docker client to a remote Docker <u>daemon</u>. The Docker client and <u>daemon</u> communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose, that lets you work with applications consisting of a set of containers.

<img src = "/Users/selhilal/Desktop/INCEPTION/img/docker-architecture.webp"></img>


## The Docker daemon

The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

## Containers
A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.

By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container's network, storage, or other underlying subsystems are from other containers or from the host machine.

A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that aren't stored in persistent storage disappear.

## How Containers Work ?

Containers are a technology that allows us to run the process in an independent environment with other processes on the same computer. So how does the container do that?

To do that, the container is built from a few new features of the Linux kernel, of which the two main features are “namespaces” and “cgroups”.

## Linux Namespaces
This is a feature of Linux that allows us to create something as a virtual machine, quite similar to the function of virtual machine tools. This main feature makes our process completely separate from the other processes.

Linux namespaces are a bunch of different kinds:

The PID namespace allows us to create separate processes.
The networking namespace allows us to run the program on any port without conflict with other processes running on the same computer.
Mount namespace allows you to mount and unmount the filesystem without affecting the host filesystem.

## Linux cgroups 

cgroups are a Linux kernel feature that enable the management and partitioning of system resources by controlling the resources for a collection of processes. Administrators can use cgroups to allocate resources, set limits, and prioritize processes. Docker utilizes cgroups to control and limit the resources available to containers.

Different types of available cgroups include CPU cgroup, memory cgroup, block I/O cgroup, and device cgroup.

While cgroups are not explicitly designed for security, they play a crucial role in controlling and monitoring the resource usage of processes.

Although namespaces and cgroups may appear similar in definition, they are fundamentally different and serve different purposes. Namespaces perform isolation by creating separate environments for processes that prevent one process from accessing or affecting other processes and/or the system. In contrast, cgroups distribute and limit resources like CPU, memory, and I/O among groups of processes. Often, namespaces and cgroups are used together for process isolation and resource management.

Now that you know more about namespaces and cgroups, it’s time to learn how to use them to control Docker performance.

## How Docker-compose work?

Docker Compose is a tool for defining and running multi-container applications. It is the key to unlocking a streamlined and efficient development and deployment experience.

Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.

Compose works in all environments; production, staging, development, testing, as well as CI workflows. It also has commands for managing the whole lifecycle of your application:

*Start, stop, and rebuild services
*View the status of running services
*Stream the log output of running services
*Run a one-off command on a service

# What is Dockerfile?

Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. This page describes the commands you can use in a Dockerfile.

## Difference between Docker Compose Vs Dockerfile

A Dockerfile is a simple text file that contains the commands a user could call to assemble an image whereas Docker Compose is a tool for defining and running multi-container Docker applications.

## The benefit of Docker compared to VMs

* Docker containers are process-isolated and don’t require a hardware hypervisor. This means Docker containers are much smaller and require far fewer resources than a VM.
* Docker is fast. Very fast. While a VM can take an at least a few minutes to boot and be dev-ready, it takes anywhere from a few milliseconds to (at most) a few seconds to start a Docker container from a container image.

## What is NGINX ?

Nginx is mostly used as reverse proxy software. Nginx is an open-source web server you can perform multiple tasks with the nginx like scalability, efficiency, and flexibility it is specially designed for high performance which can be handled in scenarios where there is a high amount of incoming requests.

## Dockerfile NGINX?

```Dockerfile
FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN mkdir -p /etc/nginx/ssl

RUN   openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/selhilal.key -out /etc/nginx/ssl/selhilal.crt -subj "/C=MA/ST=CASABLANCA/L=casa/O=42/CN=selhilal.42.fr/UID=selhilal"

COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT ["bash", "entrypoint.sh"]
```

<u>FROM debian </u>= This line specifies the base image for the Dockerfile. It uses the "bullseye" release of Debian, a popular Linux distribution known for its stability.
<u>RUN apt-get update</u> = This updates the package lists for the Debian package manager, ensuring that you can install the latest versions of packages.
<u>&& apt-get install -y nginx openssl</u> = This installs the Nginx web server and OpenSSL, a toolkit for Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols. The -y flag automatically answers "yes" to any prompts during installation.

<u>&& apt-get clean</u> = This cleans up the local repository of retrieved package files, freeing up space by removing unnecessary files.

<u>COPY conf/nginx.conf /etc/nginx/sites-available/default</u> = This copies the custom Nginx configuration file from the conf directory in your local context to the /etc/nginx/sites-available/default path inside the container. This custom configuration will replace the default Nginx site configuration.

<u>RUN mkdir -p /etc/nginx/ssl</u> = This creates the directory /etc/nginx/ssl inside the container. The -p flag ensures that the directory is created along with any necessary parent directories.

<u> RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/selhilal.key -out /etc/nginx/ssl/selhilal.crt -subj "/C=MA/ST=CASABLANCA/L=casa/O=42/CN=selhilal.42.fr/UID=selhilal"</u> = This generates a self-signed SSL certificate using OpenSSL. The -x509 option outputs a self-signed certificate instead of a certificate request. The -nodes option skips the passphrase protection for the key. The -days 365 option sets the certificate validity period to 365 days. The -newkey rsa:2048 option creates a new certificate request and a new 2048-bit RSA key. The -keyout option specifies the output file for the private key, and the -out option specifies the output file for the certificate. The -subj option sets the certificate's subject details, such as country (C), state (ST), location (L), organization (O), common name (CN), and user ID (UID).

<u>COPY tools/entrypoint.sh /entrypoint.sh</u> =  This copies the entrypoint.sh script from the tools directory in your local context to the /entrypoint.sh path inside the container. This script will be executed when the container starts.

<u> RUN chmod +x /entrypoint.sh </u> = This makes the entrypoint.sh script executable by changing its permissions.

<u>ENTRYPOINT ["bash", "entrypoint.sh"] </u> = This sets the container's entrypoint to the entrypoint.sh script, ensuring that it is executed when the container starts. The script will be run using bash.
