# Deployment of FortiGate-VM (BYOL/PAYG) Cluster on the AWS
## Introduction
A Terraform script to deploy a FortiGate-VM Cluster on AWS in Single AZ Topology

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Terraform Provider AWS 3.63.0
* Terraform Provider Template 2.2.0


## Deployment overview
Terraform deploys the following components:
   - A AWS VPC with 4 subnets
   - Two FortiGate-VM (PAYG) instances with four NICs in Single AZ.
   - Two Network Security Group rules: one for external, one for internal.
   - Two Route tables: one for internal subnet and one for external subnet.

![HA-Single-AZ-architecture](./aws-ha-single-az.png?raw=true "HA Single AZ Architecture")


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
FGTPassiveMGMTPublicIP = <Passive FGT Management Pubcli IP>
Password = <FGT Password>
Username = <FGT admin>

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

