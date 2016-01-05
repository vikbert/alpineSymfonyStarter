FROM alpine:3.2

# update and remove cache file
RUN apk add --update nginx && rm -rf /var/cache/apk/*

# config nginx
RUN mkdir -p /tmp/nginx/client-body
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# start nginx service
CMD ["nginx", "-g", "daemon off;"]