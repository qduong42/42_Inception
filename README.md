#  Inception - @42Wolfsburg

## Purpose

Inception is in the 2nd last ring of the Core Curriculum(Studies) @42Wolfsburg.

## Installation & Usage

### Requirements
The only requirements are:
- GNU make (v3.81)
- Docker (refer to [official documentation](https://docs.docker.com/engine/install/) for your system. (Docker Compose version 3)

Those versions are the ones used during development.

### Building the program

1. Download/Clone this repo

        git clone https://github.com/qduong42/42_Inception
2. `cd` into the 42_Inception directory and run `make`

        cd 42_Inception
        make
3. This project includes some secret files to show a functional project right off the bat.
   - Secrets are in srcs/requirements/tools: x.key and x.crt and in srcs/.env
   - REPLACE with your own .env and .key and .crt and add them to .gitignore or use git secret.
   - ENV Variables are used in Dockerfiles and docker-compose.yml file to ensure you can change secrets as you want.

### Running the program

navigate to https://localhost:443 or https://127.0.0.1:443. You may get a warning, as the site uses a self signed https certificate.

## Details about the project:
