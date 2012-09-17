#!/bin/bash
if [[ -e /etc/node.facts ]]; then
    CLUSTER=`sed -n -e 's/^cluster=//p' /etc/node.facts`
    TIER=`sed -n -e 's/^tier=//p' /etc/node.facts`
    echo $CLUSTER $TIER
fi
