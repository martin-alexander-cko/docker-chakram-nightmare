FROM node:9.11-slim


COPY ./package.json /etc/node/package.json
WORKDIR /etc/node

# Install Node.js packages from packages.json 
RUN npm install

# Install shared libraries for xvfb and electron
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

# Start 'npm run test' in a virtual X server environment
CMD xvfb-run -a --server-args='-screen 0 1366x768x24' npm run test
