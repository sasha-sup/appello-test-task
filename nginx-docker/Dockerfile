FROM nginx:1.23.1
ENV TZ=Australia/Sydney
COPY ./test-page.conf ./etc/nginx/conf.d/default.conf
RUN \
    mkdir -p /var/www/html/test-page \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 
WORKDIR /var/www/html/test-page
COPY ./index.html ./
EXPOSE 8228