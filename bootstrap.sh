#! /bin/bash

function apt_update
{
    if [ ! -e /root/apt-update.sema ];
    then
    apt-get update && touch /root/apt-update.sema
    fi
}
function install_docker_engine
{
    if [ ! -e /root/docker2.sema ];
    then
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    touch /etc/apt/sources.list.d/docker.list
    echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
    apt-get update && apt-get purge lxc-docker
    apt-cache policy docker-engine
    apt-get install -y linux-image-extra-$(uname -r)
    apt-get update && apt-get install -y docker-engine
    service docker start
    touch /root/docker2.sema
    fi
}

function install_docker_compose
{
    if [ ! -e /root/docker_compser.sema ];
    then
    apt-get install --yes python-pip
    pip install docker-compose
    touch /root/docker.sema
    fi
}

function set_bash_aliases()
{
    if [ ! -e /root/aliases.sema ];
    then
    ln -s /home/vagrant/bash_aliases.sh /home/vagrant/.bash_aliases
    touch /root/aliases.sema
    fi
    chown vagrant:vagrant /home/vagrant/.bash_aliases

}

apt_update
install_docker_engine
install_docker_compose
set_bash_aliases

cd /vagrant/
