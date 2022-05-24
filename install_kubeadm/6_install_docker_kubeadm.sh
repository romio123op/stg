curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

 apt-get install -y docker-ce docker-ce-cli containerd.io

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb http://apt.kubernetes.io kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list

apt-get update

apt-get -y  install kubelet kubeadm kubectl

swapoff -a

sed -i '/ swap / s/^/#/' /etc/fstab
