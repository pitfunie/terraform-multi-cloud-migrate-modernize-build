Step 3: Create Shell Scripts

#!/bin/bash

set -e

ACTION=$1
CLOUD=$2
REGION=$3
VPC_COUNT=$4

if [ "$CLOUD" == "aws" ]; then
  VAR_FILE="aws.tfvars"
elif [ "$CLOUD" == "gcp" ]; then
  VAR_FILE="gcp.tfvars"
else
  echo "Unsupported cloud provider. Use 'aws' or 'gcp'."
  exit 1
fi

case "$ACTION" in
  init)
    terraform init
    ;;
  plan)
    terraform plan -var-file=$VAR_FILE
    ;;
  apply)
    terraform apply -var-file=$VAR_FILE -auto-approve
    ;;
  destroy)
    terraform destroy -var-file=$VAR_FILE -auto-approve
    ;;
  *)
    echo "Usage: $0 {init|plan|apply|destroy} {aws|gcp} region vpc_count"
    exit 1
    ;;
esac
