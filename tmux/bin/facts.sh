#!/bin/bash
ENVIRONMENT=$(facter environment)
ROLE=$(facter role)
echo $ENVIRONMENT $ROLE
