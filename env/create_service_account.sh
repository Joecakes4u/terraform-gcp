#!/bin/zsh


# Create a service account called 'terraform' that can run gcloud commands for project in $1
gcloud config set project $1 &&
gcloud iam service-accounts create terraform  &&
gcloud iam service-accounts keys create gce-terraform-key.json --iam-account='terraform@'$1'.iam.gserviceaccount.com' 
gcloud projects add-iam-policy-binding $1 --member='serviceAccount:terraform@'$1'.iam.gserviceaccount.com' --role='roles/editor' &&
export GOOGLE_CREDENTIALS=$(cat ./gce-terraform-key.json)