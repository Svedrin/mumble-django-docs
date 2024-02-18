FROM alpine:3.11

RUN apk add --no-cache py3-sphinx make nginx dumb-init

COPY nginx.conf /etc/nginx/nginx.conf
COPY . /src
WORKDIR /src/
RUN make html
RUN chown -R nginx: /src/_build/html

ENTRYPOINT ["dumb-init", "--"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
