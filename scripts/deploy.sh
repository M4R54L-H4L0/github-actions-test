#!/bin/bash

echo "INICIO DEL PIPELINE"

ENVIRONMENT=$1
DEPLOYMENT_APPS=$2
# readarray -d , -t DEPLOYMENT_APPS<<< ${{ secrets.HEROKU_APP_LIST }}
HEROKU_API_KEY=${{ secrets.HEROKU_API_KEY }}

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
echo "Heroku deployment apps" ${DEPLOYMENT_APPS}
echo "Heroku api key" ${HEROKU_API_KEY}
echo "Environment" ${ENVIRONMENT}
# echo "Start the deployment"