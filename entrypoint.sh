#!/usr/bin/env bash
if [ "$1" = 'hydra' ]; then
    SOLR_URL=http://$SOLR6_PORT_8983_TCP_ADDR:$SOLR6_PORT_8983_TCP_PORT/solr/$CORE_NAME 
    sed -i "3s#.*#  url: $SOLR_URL#" /hydra/config/solr.yml
    sed -i "5s#.*#  url: $SOLR_URL#" /hydra/config/solr.yml
    sed -i "7s#.*#  url: $SOLR_URL#" /hydra/config/solr.yml
    
    FEDORA_URL=http://$FEDORACOMMONS_PORT_8080_TCP_ADDR:$FEDORACOMMONS_PORT_8080_TCP_PORT/rest
    sed -i "4s#.*#  url: $FEDORA_URL#" /hydra/config/fedora.yml
    sed -i "9s#.*#  url: $FEDORA_URL#" /hydra/config/fedora.yml
    sed -i "14s#.*#  url: $FEDORA_URL#" /hydra/config/fedora.yml
    
    export SOLR_URL
    cd /hydra
    rails server -b 0.0.0.0
else
   exec "$@"
fi
