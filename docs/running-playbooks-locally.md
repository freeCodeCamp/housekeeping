> **⚠️ WARNING ⚠️:**
>
> These steps are quick notes that [@raiseadead](https://github.com/raisedadead)
> has taken while getting this to work. These should be documented properly in
> the [staff-wiki](https://staff-wiki.freecodecamp.org).

Our Ansible configuration and documentation for housekeeping on some of our
instances. Study the hosts and the playbooks to run commands as shown below.

Note that these playbooks can be run from your local machine as long as you have
access to the remote nodes and the SSH key. You will also need
[ansible](https://docs.ansible.com) installed on your machine.

You can use standard Ansible syntax to execute tasks using commands. Some
examples are:

1. Check the uptime

   ```console
    ansible-playbook -i hosts playbooks/uptime.yml --extra-vars "variable_host=ghost"
   ```

   ```console
    ansible-playbook -i hosts playbooks/uptime.yml --extra-vars "variable_host=all"
   ```

2. Remove folders from client instances (older than 15 days)

   ```console
    ansible-playbook -i hosts playbooks/remove.yml --extra-vars "variable_host=prd_client"
   ```

3. Reboot

   ```console
    ansible-playbook -i hosts playbooks/reboot.yml --extra-vars "variable_host=prd_a"
   ```

4. Run ad-hoc commands

   List files:

   ```console
    ansible -a "ls -1 client/releases" -i hosts a.eng.client.pubdns.freecodecamp.org
   ```

   Add a SSH public key:

   ```console
    ansible -a "ssh-import-id gh:camperbot" -i hosts a.eng.client.pubdns.freecodecamp.org
   ```

This are some examples but, you can do almost anything you want on the remote
hosts.
