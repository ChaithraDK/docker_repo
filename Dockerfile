# Base Image for Docker
FROM ubuntu:18.04

# Install dependencies, LIBS/BIN files
RUN apt-get update -y && apt-get install apache2 -y

# Install app
RUN rm -rf /var/www/html/
ADD src/ /var/www/html/

#Configure apache
RUN echo '. /etc/apache2/envars' > /root/run_apache.sh && \
echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
