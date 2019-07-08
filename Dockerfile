FROM debian:9.5-slim

LABEL com.github.actions.name="Open a PR"
LABEL com.github.actions.description="Github action for opening a pull request."
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="purple"

LABEL repository="https://github.com/drewwyatt/open-a-pr"
LABEL maintainer="Drew Wyatt <drew.j.wyatt@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

COPY LICENSE README.md /
