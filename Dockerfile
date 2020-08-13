# react build phase
# Specify a base image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#RUN npm build
RUN npm run-script build

# run phase (server)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


# docker build .
# then to run
# docker run -p 8080:80 46d2c26c85ff 