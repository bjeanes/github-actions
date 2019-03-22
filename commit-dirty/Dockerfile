FROM alpine/git:1.0.7

LABEL "name"="commit-dirty"
LABEL "maintainer"="Bo Jeanes <me@bjeanes.com>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Commit dirty changes"
LABEL "com.github.actions.description"="Commits working tree if modified"
LABEL "com.github.actions.icon"="git"
LABEL "com.github.actions.color"="orange"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

