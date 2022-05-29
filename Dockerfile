ARG RUNDECK_IMAGE
FROM ${RUNDECK_IMAGE}

# install ansible
# base image already installed: curl, openjdk-8-jdk-headless, ssh-client, sudo, uuid-runtime, wget
# (see https://github.com/rundeck/rundeck/blob/master/docker/ubuntu-base/Dockerfile)
RUN sudo apt-get -y update \
  && sudo apt-get -y --no-install-recommends install ca-certificates python3-pip python3-setuptools \
  python3-venv sshpass zip unzip \
  # https://pypi.org/project/ansible/#history
  && sudo -H pip3 install --upgrade pip \
  && sudo -H pip3 --no-cache-dir install ansible \
  && sudo rm -rf /var/lib/apt/lists/* \  
  && sudo mkdir /etc/ansible

USER rundeck
WORKDIR /home/rundeck
ADD ssh-keys/id_rsa .ssh/id_rsa

RUN sudo chown -R rundeck /home/rundeck/.ssh \
  && sudo chmod 700 /home/rundeck/.ssh \
  && sudo chmod 600 /home/rundeck/.ssh/id_rsa
