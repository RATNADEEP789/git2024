FROM ubuntu:latest

# Update package lists and install nginx
RUN apt-get update -y && apt-get install -y nginx

# Remove existing files in the nginx document root
RUN rm -rf /var/www/html/*

# Copy application files to the nginx document root
COPY ["ABOUT THIS TEMPLATE.txt", "contact.html", "faq.html", "images", "js", "products.html", "sign-up.html", "about.html",
      "sign-in.html","css", "fonts", "index.html", "product-detail.html", "/var/www/html/"]

# Copy nginx configuration file to the appropriate location
#COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create a volume for persistent storage
VOLUME /var/www/html

# Expose port 80 for web traffic
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

