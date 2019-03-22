#!/bin/sh

set -e

if ! git diff --quiet ${WORKDIR}; then
	: ${GIT_COMMITTER_NAME:=$GITHUB_ACTOR}
	: ${GIT_COMMITTER_EMAIL:="$GITHUB_ACTOR@users.noreply.github.com"}

	git add -A .
	git commit -m "$*"
else
	echo Working tree ${WORKDIR:-"."} clean
fi
