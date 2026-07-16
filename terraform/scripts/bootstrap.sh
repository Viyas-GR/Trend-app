#!/bin/bash

set -e

log() {
    echo "=================================================="
    echo "$1"
    echo "=================================================="
}

update_system() {

	log "Updating package index"
       	apt-get update -y
}


install_java() {

	log "Installing Java"
	apt-get install -y fontconfig openjdk-21-jre
	java -version

}

install_git() {

	log "Installing Git"
	apt-get install -y git
	git --version
}

install_docker() {
	
	log "Installing Docker"
	apt-get install -y ca-certificates curl gnupg lsb-release
	install -m 0755 -d /etc/apt/keyrings

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
	| gpg --dearmor -o /etc/apt/keyrings/docker.gpg

	chmod a+r /etc/apt/keyrings/docker.gpg

	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
	https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
	| tee /etc/apt/sources.list.d/docker.list > /dev/null

	apt-get update -y

	apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

	systemctl enable docker
	systemctl start docker

	usermod -aG docker ubuntu

	docker --version
}

install_awscli() {

	log "Installing AWS CLI"

   	apt-get install -y unzip

    	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
    	-o awscliv2.zip

    	unzip -q awscliv2.zip

    	./aws/install

    	aws --version	

}


install_kubectl() {

	log "Installing kubectl"

    	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

    	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    	kubectl version --client
}

install_helm() {

	log "Installing Helm"

    	curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

    	helm version
}


install_jenkins() {
	
	log "Installing Jenkins"

    	mkdir -p /etc/apt/keyrings

    	wget -O /etc/apt/keyrings/jenkins-keyring.asc \
		https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

    	echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
        	| tee /etc/apt/sources.list.d/jenkins.list > /dev/null

    	apt-get update -y

    	apt-get install -y jenkins

    	usermod -aG docker jenkins

    	systemctl enable jenkins
    	systemctl start jenkins

    	systemctl restart docker
    	systemctl restart jenkins

    	systemctl status jenkins --no-pager

}

cleanup() {
	
	log "Cleaning up"

    	apt-get autoremove -y

    	apt-get clean

    	rm -rf aws awscliv2.zip kubectl
}

main() {

    update_system

    install_java

    install_git

    install_docker

    install_awscli

    install_kubectl

    install_helm

    install_jenkins

    cleanup

    log "Bootstrap completed successfully."
}

main
