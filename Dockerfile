# react build phase
# Specify a base image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#RUN npm run-script build

# run phase (server)
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


# docker build .
# then to run
# docker run -p 8080:80 bc8417e175d4