# Deployment of FortiGate-VM HA on the Oracle Cloud Infrastructure (OCI) with 3 ports setup
## Introduction
A Terraform script to deploy a FortiGate-VM HA Cluster Cross-AD on OCI with 3 ports setup

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI >= 4.24.0
* Terraform Provider Template >= 2.2.0
* A [OCI API key](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)

## Deployment overview
Terraform deploys the following components:
   - A Virtual Cloud Network (VPC) with two public subnets
   - A VCN with one private subnets
   - Two FortiGate-VM instances with 3 NICs each in one AD.  It will use port1 for both hasync and hamgmt.
   - Three firewall rules: one for external, one for internal, one for sync/HA management.

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
User may need to do a manual factoryreset on the units in order to get proper configurations.  To do factoryreset, user can
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
BYOL 7.0.8: ocid1.image.oc1..aaaaaaaad34fwffetlsr4k7nwwvi23xg2v7ztkgirmurub3zz6t24ndg7xjq

Marketplace Image for mp_listing_resource_id in variables.tf
PAGY 7.0.8 2ocpu: ocid1.image.oc1..aaaaaaaaoc4dkf5zyty2cxysixzvv3vnq4jsqh65udlvokxba7lew7zevy6a
PAYG 7.0.8 4ocup: ocid1.image.oc1..aaaaaaaayf7euif6ox4pofbv4rfmdkqkayb4hv4p6leuauqjyrunrwboa5pa
PAYG 7.0.8 8ocup: ocid1.image.oc1..aaaaaaaas2omahjx22uesb5awtr5pta46oksonh6w7l2kvv4wj64zbo6c6gq
PAYG 7.0.8 24ocup:  ocid1.image.oc1..aaaaaaaaxuhgh3iqlcwv53t4kktin6ptrpct6n4zabawznkc7lcptamzw45a
