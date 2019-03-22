#!/bin/sh

set -e

if ! git diff --quiet ${WORKDIR}; then
	: ${GIT_COMMITTER_NAME:=$GITHUB_ACTOR}
	: ${GIT_COMMITTER_EMAIL:="$GITHUB_ACTOR@users.noreply.github.com"}
	
	env
	git diff --stat ${WORKDIR}

	git add -A ${WORKDIR}
	git commit -m "$*"
else
	echo Working tree ${WORKDIR:-"."} clean

	# https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#exit-codes-and-statuses
	exit ${NO_CHANGES_TO_COMMIT_EXIT_CODE:-78}
fi
