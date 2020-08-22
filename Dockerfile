# react build phase
# Specify a base image
#FROM node:alpine as builder
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
#RUN npm run-script build

# run phase (server)
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html



# docker build .
# then to run
# docker run -p 8080:80 bc8417e175d4

# To make a new branch in git
# git checkout -b feature
# make a change
# add, commit
# git push origin feature