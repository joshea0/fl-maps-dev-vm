#!/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ansible/playbook.yml --inventory=ansible/inventories/vagrant_ansible_inventory --ssh-extra-args="-o IdentitiesOnly=yes" "$@"
