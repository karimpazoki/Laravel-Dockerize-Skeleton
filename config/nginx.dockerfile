ARG NGINX_VERSION

FROM nginx:${NGINX_VERSION}

COPY default.conf /etc/nginx/conf.d/default.conf
