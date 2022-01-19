FROM centos:latest

RUN yum -y install httpd

#RUN apt-get update \
#    && apt-get install -y git


# Configuration
#ENV SUMA_WEB_DIR /var/www/html
#ENV SUMA_APP_DIR /var/www/app
#ENV SUMA_LOG_PATH /var/log/suma/
#ENV SUMA_APP_USER cdsadmin
ENV TZ America/Indiana/Indianapolis

# Configure suma web server
#WORKDIR "$SUMA_APP_DIR/suma/service/web"
#RUN mv htaccess_example .htaccess
#RUN mv config/config_example.yaml config/config.yaml
#RUN sed -i 's@SUMA_SERVER_PATH.*@SUMA_SERVER_PATH: '"$SUMA_APP_DIR"'\/suma\/service@' config/config.yaml
#RUN sed -i 's@SUMA_CONTROLLER_PATH.*@SUMA_CONTROLLER_PATH: '"$SUMA_APP_DIR"'\/suma\/service\/controllers@' config/config.yaml
#RUN sed -i 's@SUMA_BASE_URL.*@SUMA_BASE_URL: \/sumaserver@' config/config.yaml

# Configure apache
COPY index.html "/var/www/html/"
COPY redirects.conf "/etc/httpd/conf.d"
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

EXPOSE 80

# Run the app
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

# Uncomment the following 2 lines if running locally
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
