FROM node:20-slim AS tailwind
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
COPY . /app
WORKDIR /app
RUN pnpm run build-tailwind

FROM ghcr.io/getzola/zola:v0.17.2 AS builder
COPY --from=tailwind /app /app
WORKDIR /app

RUN ["zola", "build"]


FROM pierrezemb/gostatic
COPY --from=builder /app/public /srv/http/
CMD [ "-fallback", "404.html" ]
