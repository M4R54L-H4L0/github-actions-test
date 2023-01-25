#!/bin/bash

echo "INICIO DEL PIPELINE"

HEROKU_APP_LIST=$1
HEROKU_API_KEY=$2
ENVIRONMENT=$3

readarray -d , -t DEPLOYMENT_APPS<<< ${HEROKU_APP_LIST}

echo "HEROKU_APP_LIST" "${{secrets.HEROKU_APP_LIST}}" ${secrets.HEROKU_APP_LIST} " FIN"

if [[ "production" == "${ENVIRONMENT}" ]]; then
  HEROKU_APP=$(echo "${DEPLOYMENT_APPS[0]}" | tr --delete '\n')
elif [[ "staging" == "${ENVIRONMENT}" ]]; then
  HEROKU_APP=$(echo "${DEPLOYMENT_APPS[1]}" | tr --delete '\n')
elif [[ "development" == "${ENVIRONMENT}" ]]; then
  HEROKU_APP=$(echo "${DEPLOYMENT_APPS[2]}" | tr --delete '\n')
fi

if [[ "" == "${HEROKU_APP}" ]]; then
  echo "HEROKU_APP should be specified"
  exit 1
fi

# git push "https://heroku:${HEROKU_API_KEY}@git.heroku.com/${HEROKU_APP}.git" HEAD:master -f
# echo "git push https://heroku:${HEROKU_API_KEY}@git.heroku.com/${HEROKU_APP}.git  HEAD:master -f"

echo "Heroku app" ${HEROKU_APP}
echo ${HEROKU_APP_LIST} | sed 's/./& /g'
echo ${HEROKU_API_KEY} | sed 's/./& /g'
echo "Deployoment apps" ${DEPLOYMENT_APPS[0]}
echo "Deployoment apps" ${DEPLOYMENT_APPS[1]}
echo "Deployoment apps" ${DEPLOYMENT_APPS[2]}