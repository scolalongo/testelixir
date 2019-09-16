FROM elixir:1.8.1-alpine AS ex_builder

RUN apk update && \
    apk add --no-cache \
    ca-certificates \
    curl \
    gawk \
    git \
    make \
    python \
    tar \
    wget \
    g++ \
    && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix hex.info && \
    cd /usr/local/bin

WORKDIR /app
ENV MIX_ENV prod
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH
ADD . .

RUN mix deps.get && \
    mix distillery.release --env=$MIX_ENV && \
    mix compile
CMD ["mix", "run"]
