# sudo apt-get install -y software-properties-common
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt-get update
# sudo apt-get install -y python3.8

sudo apt-get install -y python3-pip

pip3 install locust

echo "\n\n" >> ~/.bashrc
echo 'export PATH="/users/bluerose/.local/bin:$PATH"' >> ~/.bashrc

locust -V
