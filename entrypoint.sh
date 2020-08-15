#!/usr/bin/env bash

if [[ ! -d '/var/gerrit' ]] || [[ -z $(ls -A '/var/gerrit') ]]; then
  echo 'Moving Gerrit working directory...'
  mkdir -p /var/gerrit
  mv       /var/gerrit-tmp/* /var/gerrit
  rmdir    /var/gerrit-tmp
else
  echo 'Gerrit working directory exists and is not empty...'
  echo 'Trying to use existing files...'
fi

echo 'Running Gerrit...'
exec /var/gerrit/bin/gerrit.sh run
