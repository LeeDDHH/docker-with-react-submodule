ARG APP_HOME=/home/node/app
#FROM node:16.18-alpine
# FROM nginx:1.23.2-alpine
# WORKDIR /usr/src/app
# CMD ["npm", "start"]

# build
FROM node:16.18-alpine as build
WORKDIR ${APP_HOME}

COPY ./frontVolume ${APP_HOME}
RUN npm install
RUN npm run build

# deploy
FROM nginx:1.23.2-alpine
COPY --from=build ${APP_HOME}/dist /var/www
COPY ./nginx /etc/nginx/conf.d/

WORKDIR /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
