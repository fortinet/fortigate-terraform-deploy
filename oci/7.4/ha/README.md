# Deployment of a single FortiGate-VM on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a FortiGate-VM HA Cluster on OCI

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
x86
BYOL 7.4.6: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.6 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.6 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.6 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.6 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.6 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.4.6: ocid1.image.oc1..aaaaaaaarek6z7oszhvr6hur27ue2oakqpc6imp34eezakb33vrtyxkavt4q
PAYG 7.4.6 2ocpu: ocid1.image.oc1..aaaaaaaaeyyhcmlf2fbt2wdbyobhebwguy2zzaox6tghscyco5vgnxp75tnq
PAYG 7.4.6 4ocup: ocid1.image.oc1..aaaaaaaacvsilpxrbtyrnaw2qxy2yhouorf3v7etdacyx6slywkgmnalmxpa
PAYG 7.4.6 8ocup: ocid1.image.oc1..aaaaaaaafljvjh7homsgsw5ezyvqvth7mgwren77w2he7qori6tjsmhnbxxq
PAYG 7.4.6 16ocup: ocid1.image.oc1..aaaaaaaa4ia3qv6u7ciw42mrrpbisiul4lno7nzgb3bgwofrmhhereg4yrca
PAYG 7.4.6 24ocup: ocid1.image.oc1..aaaaaaaaqp4a6pnr7zkn3aprd6ky3gii3hw4ys47xmjg6zqspmniziyzvsna

Marketplace Image for mp_listing_resource_id in variables.tf
ARM
BYOL 7.4.6: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.6 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.6 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.6 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.6 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.6 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.4.6:  ocid1.image.oc1..aaaaaaaav2xhiv46cjchtazwivlywtejrgikyknndnfrsxdum25p5zg6rjuq
PAYG 7.4.6 2ocpu:  ocid1.image.oc1..aaaaaaaapnkx52rikkwk6m5d4r2uhaqt7uwqm32yfexonhlropnv244z3xga
PAYG 7.4.6 4ocup:  ocid1.image.oc1..aaaaaaaag4ap5r75vprra5xvwkiruwo3lbhy2tmtbzp5h4mqylsalk4tegvq
PAYG 7.4.6 8ocup:  ocid1.image.oc1..aaaaaaaak3sgznogu4hskdp3eazmbyxtazcahjv4witfrqybnh7nks745a7q
PAYG 7.4.6 16ocup:  ocid1.image.oc1..aaaaaaaaovwh3dcp3po6nyialg2prcyngzkhunwikgdooxatoarw2ft24tga
PAYG 7.4.6 24ocup:  ocid1.image.oc1..aaaaaaaay3t3wx34njceip3tlujlu5m53pxf74bjzinaj24fn2mrwyij4otq
