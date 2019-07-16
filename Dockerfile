FROM airdb/nodejs
MAINTAINER Copyright @ airdb.com

ENV WORKDIR /srv/
WORKDIR ${WORKDIR}
ADD ./ ${WORKDIR}

RUN npm run build

COPY --from=alpine /dist /srv
