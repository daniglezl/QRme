$privileged = <<SCRIPT
# update system
apt-get update

# install libraries
apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev
apt-get install -y libreadline-dev libyaml-dev libsqlite3-dev sqlite3
apt-get install -y libxml2-dev libxslt1-dev libcurl4-openssl-dev
apt-get install -y python-software-properties libffi-dev nodejs
apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
apt-get install -y postgresql postgresql-contrib libpq-dev

# install ZSH
apt-get install -y zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
chsh -s /usr/bin/zsh vagrant
echo 'export PATH=vendor/bin:$PATH'  >> /home/vagrant/.zshrc
echo "alias r='rails'" >> /home/vagrant/.zshrc
echo "alias rs='rails server -b 0.0.0.0'" >> /home/vagrant/.zshrc
SCRIPT

$unprivileged = <<SCRIPT
# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install $1
rvm use $1 --default

# Bundle
gem install bundler
cd /vagrant
bundle install --without production

# set up DB
sudo -u postgres createuser -s vagrant
rails db:create
rails db:migrate
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provision :shell, inline: $privileged
  config.vm.provision :shell, inline: $unprivileged,
    privileged: false, args: ["2.4.0"]
end
