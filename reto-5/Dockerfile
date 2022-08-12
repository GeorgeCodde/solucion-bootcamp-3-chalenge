FROM node:14-alpine

LABEL manteiner="jorgels120878@gmail.com"
LABEL project=node_app

WORKDIR /app

COPY ./hello-bootcamp/package*.json ./

RUN npm install

COPY ./hello-bootcamp/ .

EXPOSE 4000
USER node
CMD ["npm","start"]