#!/bin/sh

cat >/etc/nginx/conf.d/default.conf <<EOF
server {
    listen        $PORT default_server;
    server_name   _;

    location / {
        proxy_pass $TARGET;
    }
}
EOF

nginx -g 'daemon off;'
