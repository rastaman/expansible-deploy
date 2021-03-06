# Vagrantfile and Playbook to install an expansible Mesos development environment

This is a work in progress.

## Install Vagrant

## Install vbox-guest plugin for Vagrant

```
vagrant plugin install vagrant-vbguest
```

## Setting up the http proxies and local caches

As it is time consuming to download the RPM at each regeneration of the 
environment a squid cache if first setup for all the machines of the cluster.

It use a local cache (for RPMs) on the host in the folder $HOME/.squid/cache, 
and also caches folders for docker and the docker-registr in the homedir also, 
so one should create the following folders to use this project:

```
mkdir -p $HOME/.squid/dk1
```

## Starting the environment

```
vagrant up
```

## Stopping the environment

```
vagrant halt
```

At the first restart ( halt then up ) the vbox-additions will be rebuilt for the
 new kernel installed by yum update.
 
## Notes

The docker local storage and docker registry content are not cached, but the 
RPMs are.

### ceph.yml

This playbook has somewhat benn retroffited in the mali site.yml playbook. 
It installs a development ceph cluster with Rados block device (RBD) support.

### registry.yml

This playbook require the version of docker-py patched to support the volume-driver parameter.

### jenkins.yml

This playbook is a work in progress and will install a jenkins master configured to run and instantiate workers inside the mesos cluster.
