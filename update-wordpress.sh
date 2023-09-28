#!/bin/bash

CLI_USER=root
HTTP_HOST=dev-en.climatedata.ca

./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace dev-en.climatedata.ca climatedata.ca
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace dev-fr.climatedata.ca aPe2JnHUZbUy


HTTP_HOST=climatedata.ca

./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli core update 
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin upgrade --all
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace climatedata.ca dev-en.climatedata.ca
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace aPe2JnHUZbUy dev-fr.climatedata.ca


