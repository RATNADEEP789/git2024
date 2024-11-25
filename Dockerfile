FROM ubuntu:latest

# Update package lists and install nginx
RUN apt-get update -y && apt-get install -y nginx

# Remove existing files in the nginx document root
RUN rm -rf /var/www/html/*

# Copy all files to the nginx document root
COPY about.txt about.html contact.html faq.html sign-up.html products.html \
     sign-in.html product-detail.html index.html /var/www/html/

# Copy directories to the nginx document root
COPY images /var/www/html/images
COPY js /var/www/html/js
COPY css /var/www/html/css
COPY fonts /var/www/html/fonts

# Expose port 80 for web traffic
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

