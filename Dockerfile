# Use Nginx to serve Angular app
FROM nginx:alpine

# Copy Angular build output into Nginx
COPY dist/hms /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80