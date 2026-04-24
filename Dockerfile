# Use nginx base image
FROM nginx:latest

# Install wget & unzip
RUN apt-get update && apt-get install -y wget unzip

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Download repo as ZIP and extract
RUN wget -O repo.zip https://github.com/nawab8997/Devops/archive/refs/heads/main.zip \
    && unzip repo.zip \
    && cp -r Devops-main/* /usr/share/nginx/html/ \
    && rm -rf repo.zip Devops-main

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
