#!/usr/bin/env bash

appdir="/vagrant/workspace/fl-maps"

# fix for mongodb to work inside vagrant shared dir
sudo mkdir -p /home/vagrant/app/.meteor/local
sudo mount --bind /home/vagrant/app/.meteor/local/ "$appdir"/.meteor/local/
sudo chown -R vagrant:vagrant "$appdir"/.meteor

# fix node_modules to play nice inside vagrant shared dir
mkdir -p ~/vagrant_node_modules
mkdir -p "$appdir"/node_modules
sudo mount --bind ~/vagrant_node_modules "$appdir"/node_modules
sudo chown -R vagrant:vagrant "$appdir"
