FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

# install dependencies
RUN npm install

COPY . .

RUN npm run build

# ngnix Image for hosting static content.
FROM nginx

# from different phase
COPY --from=builder /app/build /usr/share/nginx/html

# no need to specify start nginx, container will take care of it automatically.

