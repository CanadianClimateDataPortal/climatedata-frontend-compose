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
        CMD="s/^display_errors.*/display_errors = On/"
        ;;
    off)
        CMD="s/^display_errors.*/display_errors = Off/"
        ;;
    *)
        usage
        ;;
esac

echo $CMD

bash -x ./compose-wrapper.sh exec portal sed -i -re "$CMD" /usr/local/etc/php/conf.d/ccdp.ini
./compose-wrapper.sh restart portal
