FROM node:14-alpine3.10

ARG ARG_GIT_COMMIT
ENV GIT_COMMIT=$ARG_GIT_COMMIT

ARG ARG_APP_VERSION
ENV APP_VERSION=$ARG_APP_VERSION

WORKDIR /app/

COPY package.json yarn.lock /app/
COPY src/ /app/src/

RUN yarn install --pure-lockfile

CMD yarn start