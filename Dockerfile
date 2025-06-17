FROM node:18-alpine

ARG DB_HOST
ARG DB_USER
ARG DB_PASSWORD
ARG DB_NAME
ARG DB_PORT

ENV DB_HOST="$DB_HOST" \
    DB_USER="$DB_USER" \
    DB_PASSWORD="$DB_PASSWORD" \
    DB_NAME="$DB_NAME" \
    DB_PORT="$DB_PORT"

WORKDIR /app

RUN apk update && apk add --no-cache curl htop

COPY . .

RUN npm install

RUN node generate-db-config.js

RUN node db/knex_init_db.js

RUN npm run build

CMD ["node", "server/server.js"]
