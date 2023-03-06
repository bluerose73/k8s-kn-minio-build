wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20230222182345.0.0.x86_64.rpm -O minio.rpm
sudo dnf install minio.rpm

cd /mydata
sudo mkdir minio
sudo chmod -R 777 ./minio