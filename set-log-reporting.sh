#!/bin/bash

# Enable or disable the PHP log reporting of the portal docker container

function usage() {
    echo "Usage: $0 <on|off>"
    exit 1
}

if [[ -z "$1" ]]
then
    usage
fi

case $1 in
    on)
        INICMD="s/^display_errors.*/display_errors = On/"
        WPCMD="s/^define.*WP_DEBUG.*/define('WP_DEBUG', true);/"
        ;;
    off)
        INICMD="s/^display_errors.*/display_errors = Off/"
        WPCMD="s/^define.*WP_DEBUG.*/define('WP_DEBUG', false);/"
        ;;
    *)
        usage
        ;;
esac

./compose-wrapper.sh exec portal sed -i -re "$INICMD" /etc/php.d/ccdp.ini
./compose-wrapper.sh exec portal sed -i -re "$WPCMD" /var/www/html/site/wp-config.php
# ./compose-wrapper.sh restart portal
