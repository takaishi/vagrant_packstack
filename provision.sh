# Install PackStack
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

sudo ip route replace default via 192.168.33.1

sudo yum install -y https://rdoproject.org/repos/rdo-release.rpm
sudo yum install -y centos-release-openstack-mitaka
sudo yum update -y
sudo yum install -y openstack-packstack

