FROM node:16.20.2-alpine AS appbuild
WORKDIR /todoapp
COPY . .
RUN npm install
RUN npm run build

FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=appbuild todoapp/build/ /usr/share/nginx/html/

