FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#/app/build folder will have the built and production ready code. because we are using /app as workdir in the above stage.

FROM nginx:alpine as run-stage
COPY --from=builder  ./app/build /usr/share/nginx/html
#In th above line --from param is where we are mentioning to copy the build folder from container to nginxes /usr/share/nginx/html
