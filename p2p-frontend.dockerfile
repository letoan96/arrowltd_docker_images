FROM node:13.7-alpine

# Add Maintainer Info
LABEL maintainer="Lee Toan <letranthetoan@gmail.com>"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
EXPOSE 8080

COPY ./p2p-frontend/package.json /usr/src/app/package.json
RUN yarn install

ENTRYPOINT npm rebuild node-sass && yarn serve:docker