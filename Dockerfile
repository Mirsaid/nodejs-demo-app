#Stage 1: Build stage

FROM node:10-alpine as builder

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

#Stage 2: Run the app in production

FROM node:10-alpine as prod

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --from=builder /home/node/app .

USER node

RUN npm install --only=production

EXPOSE 8080

CMD [ "node", "app.js" ]
