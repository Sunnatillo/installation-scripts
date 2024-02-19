#!/usr/bin/env bash
set -xe


sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl -y

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install kubelet kubeadm kubectl -y
sudo apt-mark hold kubelet kubeadm kubectl

sudo systemctl restart containerd

#sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=10.201.10.158
