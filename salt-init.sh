#!/bin/bash
salt_debs="salt-master salt-minion salt-cloud salt-api"

# disable ssh strict for github.com
sudo  echo -e "Host github.com\n\tStrictHostKeyChecking no\n" |sudo tee  /root/.ssh/config
sleep 5
# cloning salt deps
sudo apt-get update
sudo apt-get -q -y install git
sudo git clone http://github.com/bastion2202/salt-pillar.git /srv/pillar
sudo git clone http://github.com/bastion2202/salt-states.git /srv/salt

# installing salt master and minion
sudo apt-get update
sudo apt-get install -q -y software-properties-common vim git
sudo add-apt-repository ppa:saltstack/salt

sudo apt-get update
sudo apt-get install -q -y ${salt_debs}
sudo service salt-minion restart
sleep 10
sudo salt-key -A -y
