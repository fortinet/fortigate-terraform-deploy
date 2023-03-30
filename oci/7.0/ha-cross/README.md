# Deployment of FortiGate-VM HA on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a FortiGate-VM HA Cluster Cross-AD on OCI

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI >= 4.24.0
* Terraform Provider Template >= 2.2.0
* A [OCI API key](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)

## Deployment overview
Terraform deploys the following components:
   - A Virtual Cloud Network (VPC) with two public subnets
   - A VCN with two private subnets
   - Two FortiGate-VM instances with four NICs each in one AD.
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
BYOL 7.0.11:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAGY 7.0.11  2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.0.11  4ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6d5wbjlrlihw7l33nvdso74lv2s66snabevr33awotpgjownggiq
PAYG 7.0.11  8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.0.11  24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.0.11: ocid1.image.oc1..aaaaaaaajvkggybrfj2h2s22fgjyhnsuh4emtrseajftf2btu2mpjwafcn6a
PAGY 7.0.11  2ocpu: ocid1.image.oc1..aaaaaaaaf77ieaobtkvndibyvmzkh7u77ulusjm7axfj47m24kmdxzbgwg4a
PAYG 7.0.11  4ocup: ocid1.image.oc1..aaaaaaaaxqyehwo53v2lyy4bcbwtfylizk5o3l7dz3pjortwvzp4liwugena
PAYG 7.0.11  8ocup: ocid1.image.oc1..aaaaaaaabbk4bzgwvedmdi4aio3aq2c2325a37mex6xiucwsyqhyqgvcpsqq
PAYG 7.0.11  24ocup: ocid1.image.oc1..aaaaaaaaylwkpx2f22apyus3hnbxnnnlop5uloorbeawdmj7ldqnrplp7acq
