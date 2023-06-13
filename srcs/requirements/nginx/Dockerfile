FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/

COPY ./requirements/tools/* /etc/nginx/ssl/
# daemon off to enable easier debugging, -g for debug too
CMD ["nginx", "-g", "daemon off;"]