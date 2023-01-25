#!/bin/bash

echo "INICIO DEL PIPELINE"

ENVIRONMENT=$1
HEROKU_APP_LIST=$2
HEROKU_API_KEY=$3

readarray -d , -t DEPLOYMENT_APPS<<< ${HEROKU_APP_LIST}
# HEROKU_API_KEY=${{ secrets.HEROKU_API_KEY }}

# echo "Heroku app list" ${{secrets.HEROKU_APP_LIST}}

# if [[ "production" == "${ENVIRONMENT}" ]]; then
#   HEROKU_APP=$(echo "${DEPLOYMENT_APPS[0]}" | tr --delete '\n')
# elif [[ "staging" == "${ENVIRONMENT}" ]]; then
#   HEROKU_APP=$(echo "${DEPLOYMENT_APPS[1]}" | tr --delete '\n')
# elif [[ "development" == "${ENVIRONMENT}" ]]; then
#   HEROKU_APP=$(echo "${DEPLOYMENT_APPS[2]}" | tr --delete '\n')
# fi

# if [[ "" == "${HEROKU_APP}" ]]; then
#   echo "HEROKU_APP should be specified"
#   exit 1
# fi

# echo "Heroku app" ${HEROKU_APP}
echo "Environment" ${ENVIRONMENT} 
echo "Heroku deployment apps" ${HEROKU_APP_LIST}
echo "Heroku api key" ${HEROKU_API_KEY}
echo "Deployoment apps" ${DEPLOYMENT_APPS[0]}
echo "Deployoment apps" ${DEPLOYMENT_APPS[1]}
echo "Deployoment apps" ${DEPLOYMENT_APPS[2]}
# echo "Secret from GitHub" ${{secrets.HEROKU_APP_LIST}}