#!/bin/bash

CLI_USER=root
HTTP_HOST=dev-en.climatedata.ca

./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace dev-fr.climatedata.ca donneesclimatiques.ca
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace dev-en.climatedata.ca climatedata.ca


HTTP_HOST=climatedata.ca

./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin uninstall fakerpress
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin deactivate google-sitemap-generator
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin uninstall google-sitemap-generator
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin upgrade sitepress-multilingual-cms
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin upgrade wpml-string-translation
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli plugin upgrade --all
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli core update --version=6.0.3
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace climatedata.ca dev-en.climatedata.ca
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli search-replace donneesclimatiques.ca dev-fr.climatedata.ca

HTTP_HOST=dev-en.climatedata.ca
./compose-wrapper.sh exec -e HTTP_HOST="$HTTP_HOST" -e SERVER_PORT=443 -u $CLI_USER -w /var/www/html portal wp-cli theme delete twentytwentyone twentytwentythree twentytwentytwo

