## What is Docker?

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker's methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.

## What can I use Docker for?

- Your developers write code locally and share their work with their colleagues using Docker containers.
- They use Docker to push their applications into a test environment and run automated and manual tests.
- When developers find bugs, they can fix them in the development environment and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as pushing the updated image to the production environment.

## Docker architecture?

Docker uses a client-server architecture. The Docker client talks to the Docker <u>daemon</u>, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and <u>daemon</u> can run on the same system, or you can connect a Docker client to a remote Docker <u>daemon</u>. The Docker client and <u>daemon</u> communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose, that lets you work with applications consisting of a set of containers.

<img src = "img/docker-architecture.webp"></img>


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

## Enterypoint.sh

```sh
sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/default 2>/dev/null

# <3
echo "Nginx is running..."
nginx -g "daemon off;"
```
## Nginx.conf
```conf
server
{
    listen 443 ssl;
    root /var/www/html;
    index index.php;
    server_name DOMAIN_NAME;
	ssl_certificate     /etc/nginx/ssl/selhilal.crt;
    ssl_certificate_key  /etc/nginx/ssl/selhilal.key;
    ssl_protocols       TLSv1.3;

    location ~ .php$ {
        try_files $uri =404;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
```
<u>listen 443 ssl;</u> =  This tells Nginx to listen for incoming connections on port 443 using SSL/TLS.
<u>root /var/www/html; </u> = Specifies the root directory where the website files are located.
<u>index index.php; </u> =  Sets index.php as the default index file to serve when a directory is requested.
<u>server_name DOMAIN_NAME;</u> = Defines the server's domain name. This should be replaced with the actual domain name for your server (e.g., example.com).
<u>ssl_certificate /etc/nginx/ssl/selhilal.crt;</u> = Specifies the path to the SSL certificate file.
<u>ssl_certificate_key /etc/nginx/ssl/selhilal.key;</u> = Specifies the path to the SSL certificate key file.
<u>ssl_protocols TLSv1.3;</u> = Specifies the SSL/TLS protocols to be used. In this case, only TLSv1.3 is enabled for better security.
<u>location ~ \.php$ </u> =  Defines a location block for processing .php files using a regular expression. This block will be used for all requests that end in .php.
<u> try_files $uri =404; </u> = Checks if the requested file exists. If it doesn't, return a 404 error. This helps prevent direct access to PHP files.
<u>fastcgi_pass wordpress:9000;</u> =  Specifies the address and port of the FastCGI server (PHP-FPM). wordpress should be the name of the PHP-FPM service or container, and 9000 is the port number where PHP-FPM is listening.
<u>fastcgi_index index.php; </u> = Sets the default file to be served if the request is a directory.
<u>include fastcgi_params; </u> = Includes the default FastCGI parameters provided by Nginx. This file is usually located at /etc/nginx/fastcgi_params.
<u>fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name; </u> = Sets the SCRIPT_FILENAME parameter, which tells PHP-FPM the path of the script to be executed
<u>fastcgi_param PATH_INFO $fastcgi_path_info; </u> = Sets the PATH_INFO parameter, which provides additional path information to PHP-FPM.
<u>FastCGI (Fast Common Gateway Interface)  </u> =is a binary protocol for interfacing interactive programs with a web server. Unlike the traditional CGI, which creates a new process for each HTTP request, FastCGI uses persistent processes to handle multiple requests. This significantly reduces the overhead associated with creating and destroying processes for each request.
<u> </u> =
## What is Mariadb?

MariaDB Server is one of the most popular database servers in the world. It’s made by the original developers of MySQL and guaranteed to stay open source. Notable users include Wikipedia, WordPress.com and Google.


## Dockerfile
```Dockerfile
FROM  debian:bullseye

RUN apt update && apt -y install mariadb-server && apt -y install mariadb-client && apt clean

COPY    ./tools/Script.sh .
RUN     chmod +x Script.sh

ENTRYPOINT ["sh","./Script.sh"]
```
<u>FROM debian:bullseye</u> = his specifies the base image for the Dockerfile. It uses the "bullseye" release of Debian, a stable and popular Linux distribution.

<u>RUN apt update</u> = Updates the package lists for the Debian package manager, ensuring access to the latest versions of the packages.
<u>&& apt -y install mariadb-server</u> = Installs the MariaDB server package without prompting for confirmation (-y flag).
<u>&& apt -y install mariadb-client</u> = Installs the MariaDB client package without prompting for confirmation (-y flag).
<u>&& apt clean</u> = Cleans up the local repository of retrieved package files to free up space.
<u>COPY ./tools/Script.sh .</u> = Copies the Script.sh file from the tools directory in your local context to the root directory (./) inside the container.
<u>RUN chmod +x Script.sh</u> = Changes the permissions of Script.sh to make it executable
<u>ENTRYPOINT ["sh", "./Script.sh"]</u> = Sets the entrypoint for the container to execute the Script.sh script using the sh shell when the container starts.

## Script.sh
```sh
#!/bin/bash

if [ -z "$MYSQL_DATABASE" ]; then
  echo "Error: MYSQL_DATABASE is not set."
  exit 1
fi

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  echo "Error: MYSQL_ROOT_PASSWORD is not set."
  exit 1
fi

if [ -z "$MYSQL_USER" ]; then
  echo "Error: MYSQL_USER is not set."
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo "Error: MYSQL_PASSWORD is not set."
  exit 1
fi

service mariadb start
sleep 5
sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
mysqladmin -uroot password "${MYSQL_ROOT_PASSWORD}"
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mariadb -uroot -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* to ${MYSQL_USER}@'%'
WITH GRANT OPTION;"
mariadb -uroot -e "FLUSH PRIVILEGES;"

service mariadb stop
mariadbd
```

<u>if [ -z "$MYSQL_DATABASE" ]; then </u> =  Checks if the MYSQL_DATABASE environment variable is unset or empty. If it is, an error message is printed and the script exits with status code 1.
Similar checks are performed for MYSQL_ROOT_PASSWORD, MYSQL_USER, and MYSQL_PASSWORD.
If any of these required environment variables are not set, the script will print an error message and exit.

<u>service mariadb start</u> = Starts the MariaDB service.
<u> sleep 5</u> = Pauses the script for 5 seconds to give the MariaDB server time to start up fully.
<u>sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
</u> = Uses sed to find and replace the bind-address directive in the MariaDB configuration file.
Changes the bind address from 127.0.0.1 (localhost) to 0.0.0.0 (all available IP addresses) to allow remote connections.
<u>mysqladmin -uroot password "${MYSQL_ROOT_PASSWORD}"</u> = Uses mysqladmin to set the root password for MariaDB to the value of the MYSQL_ROOT_PASSWORD environment variable.
bash
<u>mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"</u> = Uses the mariadb command-line client to create a database if it doesn't already exist. The database name is taken from the MYSQL_DATABASE environment variable.
<u>mariadb -uroot -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"</u> = Creates a new MariaDB user if it doesn't already exist. The username and password are taken from the MYSQL_USER and MYSQL_PASSWORD environment variables, respectively. The % wildcard allows connections from any host.
<u>mariadb -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* to ${MYSQL_USER}@'%' WITH GRANT OPTION;"</u> = Grants all privileges on the specified database to the new user, allowing them to perform any action on the database. The WITH GRANT OPTION clause allows the user to grant these privileges to others. 
<u>mariadb -uroot -e "FLUSH PRIVILEGES;" </u> = Reloads the privilege tables to ensure that all changes take effect immediately.
<u>service mariadb stop</u> = Stops the MariaDB service.
<u> mariadbd </u> = Starts the MariaDB server in the foreground. This is typically used to keep the container running.

## What is Wordpress?
WordPress is an open-source content management system (CMS). It’s a popular tool for individuals without any coding experience who want to build websites and blogs. The software doesn’t cost anything. Anyone can install, use, and modify it for free.

## Dockerfile

```Dockerfile

FROM debian:bullseye

RUN apt update && apt install -y  php php-fpm php-curl php-mysql curl 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php/

COPY ./tools/Script.sh /tmp/Script.sh


RUN chmod +x /tmp/Script.sh

ENTRYPOINT [ "sh", "/tmp/Script.sh" ]
```
<u>FROM debian:bullseye </u> = Specifies the base image for the Dockerfile. It uses the "bullseye" release of Debian, a stable and widely-used Linux distribution.
<u>RUN apt update </u> = Updates the package lists for the Debian package manager.
<u> && apt install -y php php-fpm php-curl php-mysql curl </u> = Installs PHP, PHP-FPM (FastCGI Process Manager), PHP cURL extension, PHP MySQL extension, and the cURL command-line tool. The -y flag automatically confirms the installation of these packages.
<u>RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar</u> =  Downloads the wp-cli.phar file (WP-CLI, a command-line interface for WordPress) from the specified URL using curl with the -O option to save the file with the same name as in the UR
<u>RUN chmod +x wp-cli.phar </u> = Changes the permissions of the downloaded wp-cli.phar file to make it executable.
<u>RUN mv wp-cli.phar /usr/local/bin/wp </u> = Moves the wp-cli.phar file to /usr/local/bin/wp, making it globally accessible as wp.
<u>RUN mkdir -p /run/php/ </u> = Creates the directory /run/php/ if it doesn't already exist. This directory is often used by PHP-FPM to store its runtime files, such as PID files and Unix sockets.
<u>COPY ./tools/Script.sh /tmp/Script.sh </u> = Copies the Script.sh script from the tools directory in your local context to /tmp/Script.sh inside the container.
<u>RUN chmod +x /tmp/Script.sh </u> = Changes the permissions of the /tmp/Script.sh file to make it executable.
<u>ENTRYPOINT [ "sh", "/tmp/Script.sh" ]</u> =  Sets the entrypoint for the container to execute the /tmp/Script.sh script using the sh shell when the container starts.


## Script.sh

```sh
#!/bin/bash
sleep 15

if [ -f /var/www/html/wp-config.php ]; then
    echo "WordPress already installed"
else
    mkdir -p /var/www/html
    cd /var/www/html

    if [ ! -f /usr/local/bin/wp ]; then
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
        echo "Downloaded wp-cli"
    fi
    wp core download --allow-root 2>/dev/null
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 2>/dev/null
    wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root 2>/dev/null
    wp user create $USER_NAME $EMAIL_PRS --role=subscriber --user_pass=$USER_PASS --allow-root 2>/dev/null
    service php7.4-fpm stop
fi
sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf 2>/dev/null
echo "Starting php-fpm"
php-fpm7.4 -F -R
```
<u>sleep 15 </u> =  Pauses the script for 15 seconds to allow other services (such as the database server) to start up properly before proceeding.
<u>if [ -f /var/www/html/wp-config.php ]; then:</u> =Checks if the WordPress configuration file (wp-config.php) already exists in the /var/www/html directory. If it does, it means WordPress is already installed.
else: If the wp-config.php file does not exist, proceed with the following commands to install WordPress.
<u>mkdir -p /var/www/html </u> = Creates the /var/www/html directory if it doesn't already exist.
<u>cd /var/www/html</u> = Changes the current directory to /var/www/html.
<u>if [ ! -f /usr/local/bin/wp ]; then:</u> = Checks if the wp command (WP-CLI) is not already installed in /usr/local/bin.
<u>curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar</u> = Downloads the WP-CLI Phar file.
<u>chmod +x wp-cli.phar</u> = Makes the WP-CLI Phar file executable.
<u>mv wp-cli.phar /usr/local/bin/wp </u> = Moves the WP-CLI Phar file to /usr/local/bin/wp, making it accessible as wp.
<u> wp core download --allow-root 2>/dev/null</u> = Downloads the core WordPress files. The --allow-root flag allows WP-CLI to run as the root user. The 2>/dev/null part redirects error messages to /dev/null, effectively discarding them.
<u>wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 2>/dev/null </u> = Creates the wp-config.php file with the specified database credentials and host. The values for MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD, and mariadb are substituted from the environment variables.
<u>wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root 2>/dev/null</u> =  Installs WordPress with the specified site URL, title, and admin credentials.
<u>wp user create $USER_NAME $EMAIL_PRS --role=subscriber --user_pass=$USER_PASS --allow-root 2>/dev/null</u> = Creates a new WordPress user with the specified username, email, role, and password.
<u>service php7.4-fpm stop </u> = Stops the PHP-FPM service, which is not needed after the initial setup.
<u>sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf 2>/dev/null </u> =  Modifies the PHP-FPM configuration to listen on all IP addresses (0.0.0.0) on port 9000. This allows external connections to PHP-FPM. The 2>/dev/null part redirects error messages to /dev/null, effectively discarding them
<u>php-fpm7.4 -F -R</u> =  Starts PHP-FPM version 7.4 in the foreground (-F) and allows running as root (-R). Running in the foreground is necessary to keep the Docker container running, as Docker containers exit when the main process ends.