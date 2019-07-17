FROM airdb/nodejs
MAINTAINER Copyright @ airdb.com

ENV WORKDIR /srv/
WORKDIR ${WORKDIR}
ADD ./ ${WORKDIR}

RUN npm run build

FROM airdb/alpine
COPY --from=0 /srv/dist /srv/dist

RUN apk add --no-cache nginx && \
	mkdir -p /run/nginx && \
	sed -i '1 idaemon off;'  /etc/nginx/nginx.conf

COPY default.conf /etc/nginx/conf.d/

CMD ["nginx"]
