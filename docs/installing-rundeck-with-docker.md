> **⚠️ WARNING ⚠️:**
>
> These steps are quick notes that [@raiseadead](https://github.com/raisedadead)
> has taken while getting this to work. These should be documented properly in
> the [staff-wiki](https://staff-wiki.freecodecamp.org).

Installing rundeck and ansible:

1. Create a `.env` from the `sample.env`.
2. Replace the keys with the required values.
3. Create the `web` network with `docker network create web`.
4. Create the keys in the `ssh-keys` folder for building the Docker containers.
5. Create a first-time default user in `rundeck/config/realm.properties`.
6. Configure the DNS records as required.
7. Set up the UFW firewall to allow access to `https`.
8. Startup the services

   ```console
   docker-compose config
   docker-compose up -d
   ```

9. Once installed and verified, you can log in to the `rundeck` server with the
   default credentials created in the `rundeck/config/realm.properties` file.

10. Create and configure projects, ansible hosts, and jobs. Here are some
    helpful paths you will need will using the UI:

    | Type of Path      | Location                  |
    | :---------------- | :------------------------ |
    | Ansible Base      | `/etc/ansible`            |
    | Ansible Hosts     | `/etc/ansible/hosts`      |
    | Ansible Config    | `/etc/ansible/config`     |
    | SSH Username      | -- ask a staff            |
    | SSH key file path | /home/rundeck/.ssh/id_rsa |

    Apart from the above, you can use the playbooks in the `ansible/playbooks`,
    like so `/etc/ansible/playbooks/<filename>.yml`, for example,
    `/etc/ansible/playbooks/uptime.yml` when creating jobs with the Ansible
    playbook templates.

11. Do a test run with the Uptime check job from the dashboard.
