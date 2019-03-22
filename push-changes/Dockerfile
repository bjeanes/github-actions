FROM alpine/git:1.0.7

LABEL "name"="push-changes"
LABEL "maintainer"="Bo Jeanes <me@bjeanes.com>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Push commits created in workflow"
LABEL "com.github.actions.description"="Pushes commits created since the SHA that triggered workflow"
LABEL "com.github.actions.icon"="git"
LABEL "com.github.actions.color"="orange"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

