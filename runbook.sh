Step 5: Runbook

Runbook:
Purpose

This runbook outlines the steps required to migrate, modernize, and build infrastructure in AWS and GCP using Terraform.
Steps

    Initialize Terraform:
    sh

./terraform_actions.sh init aws us-east-1 127

Plan the Infrastructure:
sh

./terraform_actions.sh plan aws us-east-1 127

Apply the Terraform Configuration:
sh

./terraform_actions.sh apply aws us-east-1 127

Verify Resources:

    Check VPCs, subnets, and instances in the AWS Management Console.

    Ensure Security Groups are correctly configured.

Repeat for GCP:
sh

./terraform_actions.sh init gcp us-central1 127
./terraform_actions.sh plan gcp us-central1 127
./terraform_actions.sh apply gcp us-central1 127

Destroy the Infrastructure (if needed):
sh

./terraform_actions.sh destroy aws us-east-1 127
./terraform_actions.sh destroy gcp us-central1 127
