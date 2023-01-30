FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
COPY yarn.lock ./

RUN yarn install

# Bundle app source
COPY . .

RUN cp .env.development .env.local

EXPOSE 3000

#ENV REACT_APP_MAINNET_CHAIN_RPC_URL=http://localhost:5000

RUN yarn build

# npm start with option to add arguments
CMD yarn start
