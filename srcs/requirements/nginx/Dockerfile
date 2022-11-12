# Use port 443
# Use TLSv1.2 or TLSv1.3

FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

#daemon mode launches in background, we want to disable this mode to get nginx logs directly in the container tty