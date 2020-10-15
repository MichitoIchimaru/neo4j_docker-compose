#!/bin/bash

if [ -f /init/done ]; then
    echo "The initialization process is already completed." >> /init/setup.log
    exit 1
fi

COUNT=1

while [ $COUNT -lt 20 ]; do

  status_code=$(curl --write-out %{http_code} --silent --output /dev/null localhost:7474)
  if [[ "$status_code" = 200 ]] ; then
    touch /init/done
    cypher-shell -u neo4j -p p@ssw0rd -f /tmp/init.cypher
    echo "The initialization process is complete." >> /init/setup.log
    exit 1
  else
    echo "The neo4j service has not started yet. [$COUNT]" >> /init/setup.log
  fi

  COUNT=$(expr $COUNT + 1)
  sleep 10s

done

exit 0