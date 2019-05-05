# 
# FROM mongo:4-xenial
# 
# https://hub.docker.com/_/mongo
# 
# Configuración de Docker para contener formio app
#
FROM mongo:4-xenial

# Update and Upgrade
RUN apt-get update && apt-get upgrade -y

# Customize configuration
COPY config/custom.conf /etc/mongo/mongod.conf

# Config User DB
COPY scripts/user-gisdata.sh /docker-entrypoint-initdb.d/user-gisdata.sh

# Port MongoDB
EXPOSE 27017

# Formio Application
WORKDIR /app

# Install Node
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs


# Copy Formio App
COPY formio-master/ .

# Install Formio App
RUN npm install

# Formio Ports
EXPOSE 3002
EXPOSE 8080

# Run Formio App
# CMD npm start
