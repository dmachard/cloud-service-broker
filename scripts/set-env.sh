#!/usr/bin/env bash

set +x # Hide secrets

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && echo -e "You must source this script\nsource ${0}" && exit 1

export ARM_SUBSCRIPTION_ID=$(lpass show --notes "Shared-CF Platform Engineering/Azure Service Account Key" | jq -r .subscription_id)
export ARM_TENANT_ID=$(lpass show --notes "Shared-CF Platform Engineering/Azure Service Account Key" | jq -r .tenant_id)
export ARM_CLIENT_ID=$(lpass show --notes "Shared-CF Platform Engineering/Azure Service Account Key" | jq -r .client_id)
export ARM_CLIENT_SECRET=$(lpass show --notes "Shared-CF Platform Engineering/Azure Service Account Key" | jq -r .client_secret)

export GCP_SERVICE_ACCOUNT_JSON=$(lpass show --notes "Shared-CF Platform Engineering/pks cluster management gcp service account")
export ROOT_SERVICE_ACCOUNT_JSON="${GCP_SERVICE_ACCOUNT_JSON}"

export SECURITY_USER_NAME=brokeruser
export SECURITY_USER_PASSWORD=brokeruserpassword
export DB_HOST=localhost
export DB_USERNAME=broker
export DB_PASSWORD=brokerpass
export PORT=8080