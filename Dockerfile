FROM alpine:3.5

RUN apk --no-cache add dumb-init libldap postgresql-libs python2 py2-pip && \
    apk --no-cache add --virtual .build-dependencies gcc git musl-dev openldap-dev python2-dev postgresql-dev && \
    git clone --depth=1 https://github.com/opatut/dudel.git /dudel && \
    pip install -r /dudel/requirements.txt && \
    apk --no-cache del .build-dependencies

WORKDIR /dudel

USER daemon

ENTRYPOINT /usr/bin/dumb-init
CMD make run
