FROM alpine:3.11

RUN apk add --no-cache py3-sphinx py3-django make nginx dumb-init

COPY nginx.conf /etc/nginx/nginx.conf
COPY . /src
WORKDIR /src/

RUN wget -P /tmp/ 'https://github.com/Svedrin/mumble-django/archive/refs/heads/master.zip' && \
    unzip /tmp/master.zip -d / && \
    2to3 -w /mumble-django-master && \
    sed -i -e 's/file(/open(/g' /mumble-django-master/pyweb/settings.py && \
    make html && \
    rm -rf /mumble-django-master

RUN chown -R nginx: /src/_build/html

ENTRYPOINT ["dumb-init", "--"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
