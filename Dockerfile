FROM node:18-alpine

WORKDIR /app

RUN apk update && apk add --no-cache curl htop

COPY . .

RUN npm install

RUN node generate-db-config.js

RUN node db/knex_init_db.js

RUN npm run build

CMD ["node", "server/server.js"]
