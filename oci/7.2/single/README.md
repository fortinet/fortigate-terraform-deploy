# Deployment of a single FortiGate-VM on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a single FortiGate-VM on OCI

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI >= 4.50.0
* Terraform Provider Template >= 2.2.0
* A [OCI API key](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)

## Deployment overview
Terraform deploys the following :
   - A Virtual Cloud Network (VCN) with one public subnet
   - A VCN with one private subnet
   - A FortiGate-VM instance with two NICs, one in each subnet
   - Two firewall rules: one for the external subnet, and one for the internal subnet

## Deployment
To deploy the FortiGate-VM to OCI:
1. Clone the repository.
2. Move the OCI API key and FortiGate-VM license file to the same folder
3. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
5. Initialize the providers and modules:
   ```sh
   $ cd XXXXX
   $ terraform init
    ```
5. Submit the Terraform plan:
   ```sh
   $ terraform plan
   ```
6. Verify output.
7. Confirm and apply the plan:
   ```sh
   $ terraform apply
   ```
8. If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGate-VM instances:
```sh
Outputs:

Default_Password = [
  "<FGT Password>",
]
Default_Username = admin
PublicIP = [
  "<FGT Public IP>",
]

```

## Destroy the instance
To destroy the instance, use the command:
```sh
$ terraform destroy
```

# Support
Fortinet-provided scripts in this and other GitHub projects do not fall under the regular Fortinet technical support scope and are not supported by FortiCare Support Services.
For direct issues, please refer to the [Issues](https://github.com/fortinet/fortigate-terraform-deploy/issues) tab of this GitHub project.
For other questions related to this project, contact [github@fortinet.com](mailto:github@fortinet.com).

## License
[License](https://github.com/fortinet/fortigate-terraform-deploy/blob/master/LICENSE) © Fortinet Technologies. All rights reserved.


## Application Catalog/Image ID for deployment
Marketplace Catalog for mp_listing_id in variables.tf
BYOL 7.2.0: ocid1.image.oc1..aaaaaaaapxqi6j4dq2tl3yz4h7tqz7oqaqzcvr5renzczzeiptvk3slhcmba

Marketplace Image for mp_listing_resource_id in variables.tf
PAGY 7.2.0 2ocpu: ocid1.image.oc1..aaaaaaaa3haefpqg7myrwrc6ixslki62b4iu6nsejbxaqfum4f5cmtv2obwq
PAYG 7.2.0 4ocup: ocid1.image.oc1..aaaaaaaagf4ivombrtebdq76lykd7mfk2grh5kckrquqi7v7pyfden3ftloq
PAYG 7.2.0 8ocup: ocid1.image.oc1..aaaaaaaarweyb4lbe3kntrn5dgg5xrklua4jwqgom66iyt46wppfwakkzjta
PAYG 7.2.0 24ocup: ocid1.image.oc1..aaaaaaaariewc5zd6lkasnz4qwc6wslhfsb5wzo56r7d6w4vzztbzkajrowq
