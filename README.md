# Kali-Docker
A customized Kali docker build to avoid the overhead of running a full Kali VM. The `docker-compose` file also includes a postgres container to be used for persistent storage of the metasploit module cache data and workspace data.

## Usage
Install `docker-compose` using your distro's package manager and create a directory for postgres to use as the data directory (e.g. `mkdir postgres`). Then, start the containers with `docker-compose up -d`. You can connect to a bash shell within kali with `./connect`. When you're done, stop the containers with `docker-compose down`.

You can add further customizations, such as installing new packages in the Dockerfile.
