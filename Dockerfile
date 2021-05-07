FROM ubuntu

MAINTAINER diabouba (diabouba11@gmail.com)
# Install dependencies
RUN apt-get update
# PRECISER LE TIME ZONE c'est à dire dynamiser A CAUSE DU GIT lors de l'installation avec DEBIAN FRONTEND 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git 
EXPOSE 8080
#ADD static-website-example/ /var/www/html/
#autimatisation lors du changement du github
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/
# Au lancement demarre le server web
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
