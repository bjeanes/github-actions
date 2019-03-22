#!/bin/sh

set -e

if ! git diff --quiet ${WORKDIR}; then
	git config user.name "${GIT_COMMITTER_NAME:-"$GITHUB_ACTOR"}"
	git config user.email "${GIT_COMMITTER_EMAIL:-"$GITHUB_ACTOR@users.noreply.github.com"}"

	git diff --stat ${WORKDIR}

	git add -A ${WORKDIR}
	git commit -m "$*"
else
	echo Working tree ${WORKDIR:-"."} clean

	# https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#exit-codes-and-statuses
	exit ${NO_CHANGES_TO_COMMIT_EXIT_CODE:-78}
fi
