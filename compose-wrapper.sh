#!/bin/bash

# identify current environment (ref https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux)
case "$(uname -s)" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


export COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME:-climatedata}

if [[ ! -f ./climatedata-wp-theme/index.php ]]
then
    echo "Error: climatedata-wp-theme repository not present in ./climatedata-wp-theme/"
    echo "See README.md for more details"
    exit 1
fi

for d in ./climatedata-wp-theme/climate-data-ca/resources/app/run-frontend-sync/ ./climatedata-wp-theme/climate-data-ca/resources/app/ ./climatedata-wp-theme/climate-data-ca/resources/app/run-frontend-station-download/
do
  cp ./db.php $d
done

if [[ -f override.yaml ]]
then
  OVERRIDE="-f override.yaml"
fi

docker-compose -f climatedata-compose.yaml $OVERRIDE "$@"

# Prompt for return to keep MinGw windows opened in case the script was launched from cmd.exe
if [[ $machine == "MinGw" ]]
then
	echo ""
	echo "Press return to end this script"
	read
fi
