wget https://github.com/knative/client/releases/download/knative-v1.9.0/kn-linux-amd64 -O kn
chmod +x kn
mv kn /usr/local/bin
kn version


wget https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-v1.9.0/kn-quickstart-linux-amd64https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-v1.9.0/kn-quickstart-linux-amd64 -O kn-quickstart
chmod +x kn-quickstart
mv kn-quickstart /usr/local/bin
kn quickstart --help