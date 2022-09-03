## 404 example page

How to run:
```sh
docker compose up -d 
# or build local image:
docker build -t image-name:example && \
sed -i "s/alexsup1312\/appello-test:v1/image-name:example/g" docker-compose.yaml && \
docker compose up -d
```
nginx logs stored in `/var/log/nginx`
