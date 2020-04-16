# Srage 0
FROM node:alpine 
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# Stage 1
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html