# Install microk8s
echo "|||||||||||||| microk8s install"
sudo snap install microk8s --classic
sudo microk8s status --wait-ready
sudo microk8s enable dns registry

# Install kubectl
echo "|||||||||||||| kubectl install"
sudo snap install kubectl --classic

# Kubectl config
echo "|||||||||||||| kubectl config"
mkdir /home/vagrant/.kube
microk8s config > /home/vagrant/.kube/config

# Install default-jdk
echo "|||||||||||||| default-jdk install"
sudo apt-get update
sudo apt install default-jdk -y

# Install Helm
echo "|||||||||||||| Helm install"
sudo snap install helm --classic

# Install Docker
echo "|||||||||||||| Docker install"
curl -fsSL https://get.docker.com -o get-docker.sh > /dev/null 2>&1
sh get-docker.sh
sudo usermod -aG docker vagrant > /dev/null 2>&1
rm get-docker.sh > /dev/null 2>&1

#jeszcze ustawienia insecure registry zrobic tu

# Install Maven
echo "|||||||||||||| Maven install"
sudo apt install maven -y

# Start Jenkins
echo "|||||||||||||| Jenkins start"
runuser -l vagrant -c 'nohup java -jar /vagrant/jenkins.war &'
cat /home/vagrant/.jenkins/secrets/initialAdminPassword

