# -------- Build Stage --------
FROM node:16-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# -------- Runtime Stage --------
FROM nginx:alpine
COPY --from=build /app/dist/hms/ /usr/share/nginx/html
EXPOSE 80