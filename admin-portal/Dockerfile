FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Rebuild node-sass for the Linux environment
RUN npm rebuild node-sass

# Bundle app source
COPY . .

EXPOSE 3000
CMD ["npm", "start"]
