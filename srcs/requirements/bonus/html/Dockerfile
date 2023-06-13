FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 3000

COPY html/index.html /var/www/html/

COPY ./html/conf/nginx.conf /etc/nginx/http.d/

CMD ["nginx", "-g", "daemon off;"]