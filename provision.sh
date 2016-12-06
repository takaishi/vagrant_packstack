# Install PackStack
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network
 
sudo yum install -y https://rdoproject.org/repos/rdo-release.rpm
sudo yum install -y centos-release-openstack-mitaka
sudo yum update -y
sudo yum install -y openstack-packstack

# Install Golang with gvm
sudo yum install -y git vim bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /home/vagrant/.gvm/scripts/gvm
echo 'source /home/vagrant/.gvm/scripts/gvm' >> ~/.bashrc
gvm install go1.7.4 -B
gvm use go1.7.4 --default
export GOPATH=$HOME
