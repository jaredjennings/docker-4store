FROM alpine:latest
RUN apk update
RUN apk add ncurses readline libuuid glib raptor2 redland rasqal
COPY app/4store 4store
RUN mkdir /var/lib/4store
RUN adduser -D fourstore
RUN /4store/bin/4s-backend-setup --node 0 --cluster 1 --segments 2 default
RUN chown -R fourstore /var/lib/4store
RUN mkdir /var/log/4store
RUN chown -R fourstore /var/log/4store
VOLUME /var/lib/4store
VOLUME /var/log/4store
ADD backend-and-httpd.sh /4store/bin/backend-and-httpd.sh
RUN chmod 0755 /4store/bin/backend-and-httpd.sh
USER fourstore
CMD /4store/bin/backend-and-httpd.sh
