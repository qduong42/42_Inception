# Use port 443
# Use TLSv1.2 or TLSv1.3

FROM nginx

COPY a.html /NGINX/html

#daemon mode launches in background, we want to disable this mode to get nginx logs directly in the container tty
cmd ["nginx", "-g", "daemon off;"]