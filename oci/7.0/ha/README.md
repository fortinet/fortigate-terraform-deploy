# Deployment of a FortiGate-VM Cluster on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy FortiGate-VM HA Cluster on OCI in single AD

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI >= 3.86.0
* Terraform Provider Template >= 2.1.2
* A [OCI API key](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)

## Deployment overview
Terraform deploys the following components:
   - A Virtual Cloud Network (VPC) with two public subnets
   - A VCN with two private subnets
   - Two FortiGate-VM instances with four NICs
   - Four firewall rules: one for external, one for internal, one for sync, and one for HA management.

## Deployment
To deploy the FortiGate-VMs to OCI:
1. Clone the repository.
2. Move the OCI API key and FortiGate-VM license file to the same folder
3. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
4. Initialize the providers and modules:
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
ClusterPublicIP = <FGT Public IP>
Default_Password = [
  "<FGT Password>",
]
Default_Username = admin
FGTActiveMGMTPublicIP = [
  "<FGT Active Public IP>",
]
FGTPassiveMGMTPublicIP = [
  "<FGT Passive Public IP>",
]
```
*After deployment, FortiGate-VM instances may not get the proper configurations during the initial bootstrap configuration. 
User may need to do a manual factoryreset on the units in order to get proper configurations.  To do a factoryreset, user can
login to the units via Console, and do `exec factoryreset`*

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
BYOL 7.0.2: ocid1.image.oc1..aaaaaaaariuf772t73l4meeqblgkc4utsncbvtg3s2pujxrfbnoc47ykrcrq

Marketplace Image for mp_listing_resource_id in variables.tf
PAGY 7.0.2 2ocpu: ocid1.image.oc1..aaaaaaaa6elfa6rakbletd73e7fvaeasuhjb4qnpfwb6aketk6chh5u6x4la
PAYG 7.0.2 4ocup: ocid1.image.oc1..aaaaaaaa63jbmfi2lyj7k73ldibrqtufy3ecewterssewodne3cqfxa3fjma
PAYG 7.0.2 24ocup: ocid1.image.oc1..aaaaaaaafpkmvb2s4alsz4wzxnug736mpjjamhy2raqf4zt3c6zs6xduhaiq
PAYG 7.0.2 8ocup: ocid1.image.oc1..aaaaaaaagv3cqhasaybvqd5fsnrdcf66enlyzjeuwstssmo7sogbtohrrffq
