FROM node:lts

ENV APP_DIR /usr/src/app

RUN apt-get update && apt-get install -y \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $APP_DIR

WORKDIR ${APP_DIR}

RUN npm install -g pm2

COPY . .

RUN npm install
