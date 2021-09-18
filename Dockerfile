FROM nginx:latest

ADD init.sh /init.sh
RUN chmod +x /init.sh

CMD /init.sh
