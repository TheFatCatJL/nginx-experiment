FROM nginx:1.23-alpine

# remove the default conf because we want to use our own conf
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d