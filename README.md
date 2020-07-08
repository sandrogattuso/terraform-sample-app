# Using Terraform inside Docker with Codefresh

![Docker plus Terraform plus Codefresh](docker-terraform-codefresh.jpg)

This is an example Terraform deployment that runs in a Codefresh pipeline using docker.
More details can be found in [the documentation page](https://codefresh.io/docs/docs/yaml-examples/examples/terraform).
ssss
## Prerequisites

1. Create a [free Codefresh account](https://codefresh.io/docs/docs/getting-started/create-a-codefresh-account/)
1. Create a [Google cloud account](https://cloud.google.com/)
1. Create a [Google Service account key](https://cloud.google.com/iam/docs/creating-managing-service-account-keys)

Service Account requires the following roles:
   * roles/storage.admin
   * roles/compute.instanceAdmin.v1

Following APIs needs to be enabled:
   * compute.googleapis.com

## Create Codefresh pipeline

To use Terraform with Codefresh

1. Create a new pipeline
1. Add the following variables:
    * Service account json as a variable called `ACCOUNT_JSON_CONTENT` in a base64 encoded format
    * GCLOUD_PROJECT set to the GCP project name
    * STACK_FILE set to the file name that you want to use to track live stack
    * STACKS space separated list of possible stacks. E.g. "blue green"
    * STORAGE_BUCKET name of the Google Cloud storage where to store the state
1. Add the [pipeline content](codefresh.yml)

That's it! Run the pipeline to see it in action.


Enjoy!

