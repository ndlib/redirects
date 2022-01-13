#!/bin/bash
set -e

echo "Start server"
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
