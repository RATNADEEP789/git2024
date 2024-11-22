From ubuntu:latest

RUN apt-get update -y && apt-get install -y nginx

COPY index.html /var/www/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

VOLUME /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
