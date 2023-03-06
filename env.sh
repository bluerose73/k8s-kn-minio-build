# Flush ip table
sudo iptables -F
sudo iptables-save

# Disable swap
sudo swapoff -a
cat /etc/fstab | grep -v '^#' | grep -v 'swap' | sudo tee /etc/fstab