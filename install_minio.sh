wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio_20230222182345.0.0_amd64.deb -O minio.deb
sudo dpkg -i minio.deb

sudo mkdir /mydata/minio
sudo chmod -R 777 /mydata/minio