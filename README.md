# App Engine Terraform Module

This Terraform module is a simple way to stand up a front-end and back-end application on Google's App Engine, and a Cloud SQL Instance.

## create_service_account.sh

This script creates a service account that can run the different actions Terraform needs, and generates a json token with the right permissions to perform these actions.

### To run:

`cd env`
`chmod -X create-service-account.sh`
`./create-service-account.sh project-id`

## main.tf

TODO: Separate into a module

Definition of Terraform module.

### This module:

1. Sets Google as a provider
2. Sets project, using the auth token generated by `create-service-account.sh`
3. Creates two App Engine services (1 Front-end, 1 Back-end)
4. Creates Cloud SQL Instance.
