FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

# daemon off to enable easier debugging, -g for debug too
CMD ["nginx", "-g", "daemon off;"]