#!/usr/bin/env bash

ANSIBLE_STAGING_DIR=${ansible_staging_dir}
DOMAIN_TEAM=${domain_name}
ANSIBLE_VAULT_PASSWORD=${ansible_vault_password}
SERVER_HOSTNAME=${host_name}
ANSIBLE_BASE_REPO_URL=${ansible_base_repo_url}
ANSIBLE_BASE_REPO_DIR="$ANSIBLE_STAGING_DIR/base-infra"
ANSIBLE_INVENTORY_FILE="local_aws"
ANSIBLE_BASE_TAGS=${ansible_base_tags}
VAULT_PASSWORD_FILE_PATH="/tmp/vault_pass.txt"

echo 'starting base-ansible script'
date

rm $VAULT_PASSWORD_FILE_PATH
# rm -r $ANSIBLE_STAGING_DIR
set -e
mkdir -p $ANSIBLE_STAGING_DIR
chown ubuntu: $ANSIBLE_STAGING_DIR
chmod g+w $ANSIBLE_STAGING_DIR
cd $ANSIBLE_STAGING_DIR && git clone $ANSIBLE_BASE_REPO_URL
cd $ANSIBLE_BASE_REPO_DIR && echo $ANSIBLE_VAULT_PASSWORD >> $VAULT_PASSWORD_FILE_PATH
cd $ANSIBLE_BASE_REPO_DIR
ansible-playbook $ANSIBLE_BASE_REPO_DIR/setup.yml -c local --vault-pass $VAULT_PASSWORD_FILE_PATH --verbose --tags \
$ANSIBLE_BASE_TAGS -i $ANSIBLE_BASE_REPO_DIR/inventory/$ANSIBLE_INVENTORY_FILE --extra-vars "hostname=$SERVER_HOSTNAME"

echo 'user data script complete'
date