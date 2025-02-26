#!/bin/bash

set -a
source tf.env
set +a

terraform init
terraform plan \
    --out tfplan \
    --var "aws_region=us-west-2" \
    --var "cloudflare_token=$CLOUDFLARE_API_TOKEN" \
    --var "cloudflare_zone=$CLOUDFLARE_ZONE_ID"

echo -e "\n##################################################################"

correct_response=Yeahyuh

# If the user confirms, proceed with apply; otherwise, exit 1
read \
    -p "Are you happy with the Terraform plan? If so, type \"$correct_response\": " \
    user_response && [[ $user_response == $correct_response ]] || exit 1

echo -e "Proceeding with terraform apply..."

terraform apply --auto-approve tfplan