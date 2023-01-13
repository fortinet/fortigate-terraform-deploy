# Deployment of FortiGate-VM (PAYG/BYOL) Cluster on the AWS with 3 ports
## Introduction
A Terraform script to deploy a FortiGate-VM Cluster on AWS for Cross-AZ deployment with 3 ports only 

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.9
* Terraform Provider AWS 3.63.0
* Terraform Provider Template 2.2.0
* Needs to have FOS v7.0 later that supports the hasync/hamgmt single port feature.


## Deployment overview
Terraform deploys the following components:
   - A AWS VPC with 6 subnets.  3 subnets in one AZ.  3 subnets in second AZ.
   - Two FortiGate-VM (PAYG) instances with three NICs. (port1 - wan, port2 - internal, port3 - hasync/hamgmt).
     In this setup, both hasync and hamgmt port will be on port3 instead of separate on different ports.
   - Two Network Security Group rules: one for external, one for internal.
   - Two Route tables: one for internal subnet and one for external subnet.

![aws-ha-architecture](./aws-topology-ha-3ports.png?raw=true "HA Architecture")


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
