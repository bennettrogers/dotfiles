#!/bin/bash
ENVIRONMENT=$(facter environment)
ROLE=$(facter node_role)
echo $ENVIRONMENT $ROLE
