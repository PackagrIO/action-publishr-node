#!/usr/bin/env bash

PATH=/srv/packagr:$PATH

# retrieve the latest releasr binary
asset_url=$(curl -s https://api.github.com/repos/PackagrIO/publishr/releases/latest \
	| grep browser_download_url | grep 'packagr-publishr-linux-amd64' | cut -d '"' -f 4)

# download the publishr asset here.
curl -L -o /srv/packagr/packagr-publishr $asset_url

# make publishr executable
chmod +x /srv/packagr/packagr-publishr

if [[ ! -z "${CUSTOM_WORKING_DIRECTORY}" ]]; then
  echo "using custom dir: ${CUSTOM_WORKING_DIRECTORY}"
  cd "${CUSTOM_WORKING_DIRECTORY}"
fi

echo "Starting Publishr $1"
packagr-publishr start --scm github --package_type node
