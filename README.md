# fl-maps local development environment
A local development environment for working on the [fl-maps](https://github.com/focallocal/fl-maps) project.

## Requirements
* [Python >= 2.6](https://www.python.org)
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html#installation)
* [Vagrant](https://www.vagrantup.com/downloads.html)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Initial Setup

1. Clone this repository

    ```
    git clone https://github.com/joshea0/fl-maps-local-dev.git
    ```

2. cd into the repository directory

    ```
    cd fl-maps-local-dev
    ```


3. Start the Vagrant VM

    ```
    vagrant up
    ```

4. Run the Ansible playbook

    ```
    ./ansible/scripts/local/playbook.sh
    ```

5. Place the `settings.json` file in `workspace/fl-maps`

    ```
    cp ~/Downloads/settings.json workspace/fl-maps
    ```

    (You may have to replace `~/Downloads/settings.json` with the path to `settings.json` on your computer)

    Ask a team member on slack about how to get the `settings.json` file.

This initial setup only has to be done once. After running the Ansible playbook successfully, your VM will be ready for development. See the "Running the meteor server" section to start your local dev server.


## Running the meteor server

1. SSH into the Vagrant VM

    ```
    vagrant ssh
    ```

2. cd into the project directory

    ```
    cd /vagrant/workspace/fl-maps
    ```

3. install npm dependencies

    ```
    npm install
    ```

3. Start the server

    ```
    npm run start
    ```

You can now access your dev server at `192.168.10.10:3000`. If you changed the VM IP to something other than the default (by editting `ansible/vars/all.yml`) then use that IP instead.
