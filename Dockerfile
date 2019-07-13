FROM debian:9.5-slim

LABEL com.github.actions.name="Draft an RC"
LABEL com.github.actions.description="Github action for automating release candidates"
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="purple"

LABEL repository="https://github.com/drewwyatt/auto-rc"
LABEL maintainer="Drew Wyatt <drew.j.wyatt@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ADD utils.sh /utils.sh
RUN apt-get update && apt-get install -y jq curl
ENTRYPOINT ["/entrypoint.sh"]

COPY LICENSE README.md /
