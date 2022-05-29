# housekeeping

This repository contains configuration files for the following tools:

1. [`ansible-semaphore`](https://github.com/ansible-semaphore/semaphore)
2. [`rundeck`](https://github.com/rundeck/rundeck)

Usage:

1. Create a `.env` from the `sample.env`.
2. Replace the keys with the required values.
3. Create the ssh-keys for the Docker containers.
4. Configure the DNS records as required.
5. Set up the UFW firewall to allow access to `ssh`.
6. Create the `web` network with `docker network create web`.
7. Run the services

   ```console
   docker-compose config
   docker-compose up -d
   ```
