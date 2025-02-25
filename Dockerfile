FROM node:16

# Create app directory
WORKDIR /home/node/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY --from=cache /node_modules ./node_modules
COPY package*.json ./
COPY . ./

RUN npm install

# Bundle app source
COPY . .

RUN npm run build

ENV PORT=8080
CMD [ "npm", "start" ]