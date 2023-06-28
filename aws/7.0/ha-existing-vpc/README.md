# Deployment of FortiGate-VM (PAYG/BYOL) Cluster on the AWS
## Introduction
A Terraform script to deploy a FortiGate-VM Cluster on AWS for Cross-AZ deployment to the existing VPC infrastructure 

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider AWS 2.59.0
* Terraform Provider Template 2.1.2
* Existing VPC with 8 different subnets.  4 subnets in each AZ.
* Existing VPC already have Internet Gateway attach to it.

## Deployment overview
Terraform deploys the following components:
   - Two FortiGate-VM (PAYG) instances with four NICs.
   - Two Network Security Group rules: one for external, one for internal.

![ha-architecture](./aws-topology-ha.png?raw=true "HA Architecture")


## Deployment
To deploy the FortiGate-VM to AWS:
1. Clone the repository.
2. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
3. Initialize the providers and modules:
   ```sh
   $ cd XXXXX
   $ terraform init
    ```
4. Submit the Terraform plan:
   ```sh
   $ terraform plan
   ```
5. Verify output.
6. Confirm and apply the plan:
   ```sh
   $ terraform apply
   ```
7. If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGate-VM instances:
```sh
Outputs:

FGTActiveMGMTPublicIP = <Active FGT Management Public IP>
FGTClusterPublicFQDN = <Cluster Public FQDN>
FGTClusterPublicIP = <Cluster Public IP>
FGTPassiveMGMTPublicIP = <Passive FGT Management Public IP>
Password = <FGT Password>
Username = <FGT admin>

```
8. (Optional).  After deployment, user would needs to modify the existing route table to point to active FortiGate-VM's port2's eni for egress traffic. 

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
