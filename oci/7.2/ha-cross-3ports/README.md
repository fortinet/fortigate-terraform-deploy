# Deployment of FortiGate-VM HA on the Oracle Cloud Infrastructure (OCI) with 3 ports setup
## Introduction
A Terraform script to deploy a FortiGate-VM HA Cluster Cross-AD on OCI with 3 ports setup

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.9
* Terraform Provider OCI >= 4.50
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
x86
BYOL 7.2.8: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.2.8 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.2.8 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.2.8 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.2.8 16ocup:  ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.2.8 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.2.8: ocid1.image.oc1..aaaaaaaatktefn4ur7muxvost7ijpr4w6bxk4vxdpj3fx5ousyuwmfmdsuhq
PAYG 7.2.8 2ocpu:  ocid1.image.oc1..aaaaaaaawrfcb5qozsqotq2g3lmyleipzlr2mtaj5ocgoo3vbyqdjwsktwwa
PAYG 7.2.8 4ocup:  ocid1.image.oc1..aaaaaaaa6kasqbfch27kzfvhj6qobs2ut6w4f6znggjdjkulgeb5qomo57bq
PAYG 7.2.8 8ocup:  ocid1.image.oc1..aaaaaaaaqvlljs3ca7bipzdru5xnn362p4xgv6y2bvuahc24wynksnymurda
PAYG 7.2.8 16ocup:  ocid1.image.oc1..aaaaaaaae5ldvhqs5c5kwv3imz2t7w3bswmoweij75u2chs4bgc4rwhccayq
PAYG 7.2.8 24ocup:  ocid1.image.oc1..aaaaaaaabmdabpofzcdqmcautoz3izdipjpqaisaxqnfyh4urequz4hsz64q


Marketplace Catalog for mp_listing_id in variables.tf
ARM
BYOL 7.2.8: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.2.8 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.2.8 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.2.8 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.2.8 16ocup:  ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.2.8 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.2.8:  ocid1.image.oc1..aaaaaaaawrlnxyqwuxv4ksmilm5ocuky66vfdd2cnkfnrhimo4g4zunyoy3a
PAYG 7.2.8 2ocpu:  ocid1.image.oc1..aaaaaaaa5rkme66zvasmgh4hycs4s27c7f2wsb2ucyb7shtnnaerof5d4kpa
PAYG 7.2.8 4ocup:  ocid1.image.oc1..aaaaaaaansaudp2he6x5wtwejkhxgtrpnmr6aqg5c7aqkjb5p2betth6crra
PAYG 7.2.8 8ocup:  ocid1.image.oc1..aaaaaaaazbpuy6cvmphgr5rlbk5lf43wtgme3ybx2ppey7tp5besrzl5wxpq
PAYG 7.2.8 16ocup:  ocid1.image.oc1..aaaaaaaarj7h2qguwwaaecbu7gvvtg6d4zj2zjn2by6fbc6lsclb4dcwl66q
PAYG 7.2.8 24ocup:  ocid1.image.oc1..aaaaaaaasokjk6vrs625o3mniccmalku6vnhmyfwyr3nahjm3jiv5doci5ka
