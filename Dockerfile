FROM node:alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY package.json /usr/src/app/backend
RUN npm install
RUN npm audit fix --force

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "npm", "run" "dev" ]