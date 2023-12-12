FROM node:20-slim AS pnpmbuild
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
COPY . /app
WORKDIR /app
RUN pnpm run tailbuild

FROM ghcr.io/getzola/zola:v0.17.2 AS zolabuilder
COPY --from=pnpmbuilder /app /app
WORKDIR /app

RUN zola build


FROM pierrezemb/gostatic
COPY --from=zolabuilder /app/public /srv/http/

# 
FROM base AS prod-deps
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --frozen-lockfile

FROM base AS build
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build

FROM base
COPY --from=prod-deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist
EXPOSE 8000
CMD [ "pnpm", "start" ]
