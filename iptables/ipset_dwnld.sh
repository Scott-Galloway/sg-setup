#!/usr/bin/env bash
# Scott Galloway
# AutoShun.org IPTables Blocklist Importer

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

#__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#__ROOT="$(cd "$(dirname "${__DIR}")" && pwd)"
#__FILE="${__DIR}/$(basename "${BASH_SOURCE[0]}")"
#__BASE="$(basename ${__FILE} .sh)"

LOG=/var/log/sg_sec/shunlist.log
TIME="$(date +"%F %T")"

printf '%s\n' "${TIME} Downloading Shunlist" >> "${LOG}"

touch /tmp/shunlist.csv

wget -O /tmp/shunlist.csv http://autoshun.org/files/shunlist.csv >> "${LOG}" 2>&1

egrep -o '^([0-9]{1,3}\.){3}[0-9]{1,3}' /tmp/shunlist.csv > /tmp/blocklist.txt

while read IP;
do
    printf '%s\n' "Blacklisting IP: ${IP}"
    ipset add blacklist "${IP}"
done < /tmp/blocklist.txt

rm -f /tmp/blocklist

exit 0
