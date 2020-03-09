FROM node:lts

ARG APP_DIR_ARG

ENV APP_DIR /usr/src/app

RUN apt-get update && apt-get install -y \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR ${APP_DIR}

COPY . $APP_DIR

RUN npm install -g pm2 && npm install

CMD ["pm2 startOrRestart --no-daemon ecosystem.config.js --env development"]
