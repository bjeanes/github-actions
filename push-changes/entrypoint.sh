#!/bin/sh

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

if ! git diff --quiet ${GITHUB_SHA}... ; then
	git push ${FORCE_PUSH:+"-f"} \
		https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git \
		HEAD:${PUSH_BRANCH:-"`echo "$GITHUB_REF" | awk -F / '{ print $3 }'`"}
else
	echo No commits created in workflow

	# https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#exit-codes-and-statuses
	exit ${NO_COMMITS_TO_PUSH_EXIT_CODE:-78}
fi
