# Use nginx base image
FROM nginx:latest

# Install wget & unzip
RUN apt-get update && apt-get install -y wget unzip

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Download repo as ZIP and extract
RUN wget -O repo.zip https://github.com/nawab8997/Devops/archive/refs/heads/master.zip \
    && unzip repo.zip \
    && cp -r Devops-master/* /usr/share/nginx/html/ \
    && rm -rf repo.zip Devops-master

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
