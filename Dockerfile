# Base Image for Docker
FROM ubuntu

# Install dependencies, LIBS/BIN files
RUN apt-get update -y && apt-get install apache2 php -y

# Install app
RUN rm -rf /var/www/html/
ADD src/ /var/www/html/

EXPOSE 80
