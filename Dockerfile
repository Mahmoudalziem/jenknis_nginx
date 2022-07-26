FROM nginx:latest
COPY application/ /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html
EXPOSE 80/tcp