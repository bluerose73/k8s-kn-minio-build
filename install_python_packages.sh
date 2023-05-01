sudo apt-get install -y python3-pip

pip install -r requirements.txt

echo -e "\n" >> ~/.bashrc
echo 'export PATH="/users/bluerose/.local/bin:$PATH"' >> ~/.bashrc

locust -V
