#  Inception - @42Wolfsburg

## Purpose

Inception is a project in the 2nd last ring of the Core Curriculum(Studies) @42Wolfsburg.

## Key concepts
- Containerisation
- Docker networks
- Docker volumes
- Microservices architecture

More Details about the project [click here!](#details-about-the-project)


## Installation & Usage

### Requirements
The only requirements are:
- GNU make (v3.81)
- Docker (refer to [official documentation](https://docs.docker.com/engine/install/) for your system. (Docker Compose version 3)

Those versions are the ones used during development.

### Building the program

1. Download/Clone this repo

        git clone https://github.com/qduong42/42_Inception
2. Start Docker
3. `cd` into the 42_Inception directory and run `make`

        cd 42_Inception
        make
4. This project includes some secret files to show a functional project right off the bat.
   - Secrets are in srcs/requirements/tools: x.key and x.crt and in srcs/.env
   - REPLACE with your own .env and .key and .crt and add them to .gitignore or use git secret.
   - ENV Variables are used in Dockerfiles and docker-compose.yml file to ensure you can change secrets as you want.

### Running the program

navigate to https://localhost:443 or https://127.0.0.1:443 You may get a warning, as the site uses a self signed https certificate.

This is the main wordpress page. You can go to https://127.0.0.1/wp-login.php to login to the wp user or admin specified in the .env

### Services:
- mariadb MySQL database for persistent of wordpress blog, websites, user/admin accounts, comments
- nginx server to self host in localhost.
- php in the form of wordpress website
- adminer: Adminer is a graphical full-featured database management tool. You can interact with the database through the UI rather than through SQL Commands.
  - Navigate to `127.0.0.1:8080`
  - `system:MYSQL`
  - `server: mariadb`
  - `username & password => DB_USER and DB_PASS in .env`
  - `database: wordpress`
- static html website: simple static html website part of the bonus of the project
  - Navigate to `127.0.0.1:3000`
- vsftpd: FTP(File Transfer Protocol) server to send files
  - Download and use a FTP client of your choice. Filezilla is a common one.

## Details about the project:

This project is about creating docker images from scratch(from the base linux light-weight OS:Alpine) for each microservices used, as well as building a LEMP (Linux, Nginx, MySQL, PHP) application stack in Docker. We use Dockerfile for building the individual docker images as well as docker-compose.yml file to build the whole stack. The LEMP stack has persistent memory through a bind mount with your local system through MySQL databases using docker volumes. Additionally, wordpress is ready to use, you do not need to go through installation stages of creating an admin user and a normal user. They are pre-created through setup. 
