FROM httpd:latest

ENV TZ America/Indiana/Indianapolis

# Configure apache
COPY index.html "/usr/local/apache2/htdocs/"
COPY redirects.conf "/usr/local/apache2/conf/"

# There is already a file to start Apache. Change to reflect CDK service.ts entry point
RUN cp /usr/local/bin/httpd-foreground /usr/local/bin/docker-entrypoint.sh

# Apache command
CMD ["httpd", "-D", "FOREGROUND"]
EXPOSE 80
