FROM node:14-alpine3.10

WORKDIR /app/

COPY package.json yarn.lock /app/
COPY src/ /app/src/

RUN yarn install --pure-lockfile

CMD yarn start