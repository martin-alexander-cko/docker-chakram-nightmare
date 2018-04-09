FROM node:slim


COPY ./package.json /etc/node/package.json
WORKDIR /etc/node

# 1. Install node packages 
RUN npm install

# 2. Install shared libraries for xfvb and electron
RUN apt-get update && apt-get install -y \
        libgtk2.0-0 \
        libx11-xcb1 \
        libxtst6 \
        libxss1 \
        libgconf-2-4 \
        libnss3 \
        libasound2 \
        xvfb

ENV NODE_PATH /etc/node/node_modules/
WORKDIR /usr/src/app

CMD xvfb-run -a --server-args='-screen 0 1366x768x24' npm run test