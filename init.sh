#!/bin/sh

cat >/etc/nginx/conf.d/default.conf <<EOF
server {
    listen        $PORT default_server;
    server_name   _;

    location / {
        proxy_set_header Host $HOST;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_redirect off;
        proxy_pass $TARGET;
        proxy_connect_timeout 60s;
    }
}
EOF

nginx -g 'daemon off;'
