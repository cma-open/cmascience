#!/usr/bin/env bash

# source: https://www.innoq.com/en/blog/github-actions-automation/
# there are also variosu actions published on githug actions marketplace

set -eu

repo_uri="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

remote_name="origin"
main_branch="master"
target_branch="gh-pages"
build_dir="docs/build/html"

echo "$GITHUB_WORKSPACE"
cd "$GITHUB_WORKSPACE"

git config user.name "$GITHUB_ACTOR"
git config user.email "${GITHUB_ACTOR}@bots.github.com"

git checkout "$target_branch"
git rebase "${remote_name}/${main_branch}"
git add "$build_dir"

git commit -m "updated GitHub Pages"
if [ $? -ne 0 ]; then
    echo "nothing to commit"
    exit 0
fi

git remote set-url "$remote_name" "$repo_uri" # includes access token
git push --force-with-lease "$remote_name" "$target_branch"
