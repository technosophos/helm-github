#!/bin/bash

set -eu

usage() {
cat << EOF
GitHub and GitHub Pages integration with Helm.

This provides tools for working with GitHub. Mainly, it is for using
GitHub Pages as a chart repository by storing charts in the 'docs/' directory
of the current project.

Available Commands:
  push    Push a chart (repository) to GitHub pages.

EOF
}

push() {
  echo "Packaging $1"
  cp "${1}" "./docs/${1}"
  if [ -e ${1}.prov ]; then
    cp "${1}.prov" "./docs/${1}.prov"
  fi
  helm repo index ./docs
  git add docs/$1 ./docs/index.yaml
  git commit -m "Auto-commit $1"
  git push origin master
  echo "Successfully pushed $1 to GitHub"
}

if [[ $# < 2 ]]; then
  usage
  exit 1
fi

case "${1:-"help"}" in
  "push")
    push $2
    ;;
  "help")
    usage
    ;;
  *)
    usage
    exit 1
    ;;
esac
