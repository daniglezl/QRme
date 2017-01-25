# README

## QRme

### Setup
* Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
* Download and install [Vagrant](https://www.vagrantup.com/downloads.html).
There is a `Vagrantfile` included.
Just clone the project and run `vagrant up` inside the root folder and it will
create a complete environment with `ubuntu 14.04`, `ruby 2.4.0` and `Rails 5.0.1`.
`vagrant up` will take a while the first time since it needs to download the image
(assuming you don't already have it in your system), update the OS, and install
the required libraries and gems. It also sets up the DB (postgres).

### Accessing VM
Inside the root folder run `vagrant ssh` and you will be inside the vm.
Change directory to `/vagrant` and run `rs`. `rs` is mapped to
`rails server -b 0.0.0.0` which is necessary to access `http://localhost:3000`
from outside the vm. If `http://localhost:3000` doesn't work, try `http://127.0.0.1:3000`.
Press `Ctrl+D` or type `exit` at any time to stop the ssh connection.

### Vagrant
All these commands need to run where the `Vagrantfile` is (root)
* `vagrant suspend` will stop the VM but still consumes HD space and saves state of RAM too.
* `vagrant halt` will stop VM and save just the state
* `vagrant destroy` will destroy the vm
* In any case run `vagrant up` to recreate the VM or just start it back up

Use `vagrant halt` if you are not going to use the VM again right away.
