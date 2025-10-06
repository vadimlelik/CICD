# Stage 1: build
FROM node:18 AS build

WORKDIR /app
COPY ./frontend/package.json ./frontend/package-lock.json ./
RUN npm install
COPY ./frontend ./
RUN npm run build

# Stage 2: production
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
