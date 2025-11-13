# Deployment of a single FortiGate-VM on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a FortiGate-VM HA Cluster on OCI with 3 ports setup

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.9
* Terraform Provider OCI >= 4.50
* Terraform Provider Template >= 2.2.0
* A [OCI API key](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)

## Deployment overview
Terraform deploys the following components:
   - A Virtual Cloud Network (VPC) with two public subnets
   - A VCN with one private subnets
   - Two FortiGate-VM instances with 3 NICs.  hamgmt/sync, untrust, and trust 
   - Four firewall rules: one for external, one for internal, one for sync/HA management.

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
login to the units via Console, and do `exec factoryreset` on each of the units*

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
BYOL 7.4.9:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.9 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.9 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.9 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.9 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.9 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
ARM
BYOL 7.4.9:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.9 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.9 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.9 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.9 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.9 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa


Marketplace Image for mp_listing_resource_id in variables.tf
x86
BYOL 7.4.9:  ocid1.image.oc1..aaaaaaaa3jzlu266v4duvkvu4l5lziu3rhpfyjj2vofbpptswmkog3nccehq
PAYG 7.4.9 2ocpu: ocid1.image.oc1..aaaaaaaaqla3waj3lpy6xirop5vivep35d66sqpqstjtrt5diff3cydonmja
PAYG 7.4.9 4ocup: ocid1.image.oc1..aaaaaaaal2h75734ckxmq5z5vgjbmznqk2ujagpuhdvia6slfsbhldvhakha
PAYG 7.4.9 8ocup: ocid1.image.oc1..aaaaaaaa5dbwvlsosqwoizum5ofm5uvnzvpsmkppy4xsoovchkyihaqo243a
PAYG 7.4.9 16ocup: ocid1.image.oc1..aaaaaaaa4bto4gkyr3ih4tugcgulr4kilbupvvs6iowohycrgi3nwzinxp2a
PAYG 7.4.9 24ocup: ocid1.image.oc1..aaaaaaaayacizfybvrkzix3znb54bblrgmg3eyx6njaugswcrym56yrebena
ARM
BYOL 7.4.9:  ocid1.image.oc1..aaaaaaaadjbuji7ltjrimr3d5yfavmugkdpmex2nh7wxpvdq7mvivfmtrjtq
PAYG 7.4.9 2ocpu:  ocid1.image.oc1..aaaaaaaarf677hv6jv5hgzjmdpz6dzowrv6tlyh3db2cz7fnwnwcm4cawcya
PAYG 7.4.9 4ocup:  ocid1.image.oc1..aaaaaaaawwp3frc6xkoqm6tureogq6annnoegv2vorrk46mlncmv2ymjvoua
PAYG 7.4.9 8ocup:  ocid1.image.oc1..aaaaaaaaa7uyew2zzfo3ttfcfxr26eugwkmxvjuttxg2rbbdbx7keclq57ra
PAYG 7.4.9 16ocup:  ocid1.image.oc1..aaaaaaaawrajcygnfwzjo2hfcjrhbnxkzasozmstvyutkyc5xo3skwgncu2q
PAYG 7.4.9 24ocup:  cid1.image.oc1..aaaaaaaaxwtqpse6c44nrumc4pgvmleqaqeggpov6nhunasnd5qrgiekz63q
