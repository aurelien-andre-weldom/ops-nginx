#!/bin/bash
set -e

files="
/etc/nginx/nginx.conf
"

for file in $files; do

  if [ -f "$file" ]; then

    for e in "${!NGINX_@}"; do

        sed -i -e 's!__'"$e"'__!'"$(printenv "$e")"'!g' "$file"

    done

  fi

done
