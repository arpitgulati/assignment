#!/usr/bin/env bash
environment=$1
tags=$2
ansible-playbook -i inventory/$environment elasticsearch.yml -u ubuntu --vault-pass vault_pass.txt --extra-vars="env=$environment" --private-key=~/keys/elastic-pre-production.pem --tags="$tags"
