#!/bin/bash


export COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME:-climatedata}

if [[ ! -f ./climatedata-wp-theme/index.php ]]
then
    echo "Error: climatedata-wp-theme repository not present in ./climatedata-wp-theme/"
    echo "See README.md for more details"
    exit 1
fi

for d in ./climatedata-wp-theme/climate-data-ca/resources/app/run-frontend-sync/ ./climatedata-wp-theme/climate-data-ca/resources/app/ ./climatedata-wp-theme/climate-data-ca/resources/app/run-frontend-station-download/
do
  rsync -t ./db.php $d
done

if [[ -f override.yaml ]]
then
  OVERRIDE="-f override.yaml"
fi

docker-compose -f climatedata-compose.yaml $OVERRIDE "$@"
