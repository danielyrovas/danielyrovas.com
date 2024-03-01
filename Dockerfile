FROM alpine:edge as builder

ARG HUGO_BASEURL=
ENV HUGO_BASEURL=${HUGO_BASEURL}

RUN apk add hugo git
COPY . /app
WORKDIR /app
RUN hugo --minify --gc --enableGitInfo

FROM pierrezemb/gostatic
COPY --from=builder /app/public /srv/http/
CMD [ "-fallback", "404.html" ]
