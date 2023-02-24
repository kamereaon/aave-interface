FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
COPY yarn.lock ./

COPY sandigo-sdk ./sandigo-sdk

RUN yarn add ./sandigo-sdk

RUN yarn install

# Bundle app source
COPY . .

EXPOSE 3000

RUN cp .env.sandigo.prod .env

RUN yarn build

# npm start with option to add arguments
CMD yarn start
