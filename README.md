# Playbook to install an expansible Mesos development environment

This is a work in progress.

## Setting up the http proxies and local caches

As it is tie consuming to download the RPM at each regeneration of the 
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

## Notes

It can help to destroy and rebuild a box if one want to restart it, after 
the host has suspended by itself (i.e. a laptop).

'vagrant halt' followed by 'vagrant up' didn't work, there is a problem with the
virtual box guest additions which are not running even if they are installed.

Also, the docker local storage and docker registry content are not cached.