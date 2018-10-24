FROM nginx:latest
RUN apt-get update && apt-get install -y curl
COPY website/ /usr/share/nginx/html/
EXPOSE 80