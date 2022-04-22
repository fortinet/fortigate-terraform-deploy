# Deployment of a FortiGate-VM(BYOL/PAYG) HA cluster on the Alicloud
## Introduction
A Terraform script to deploy a FortiGate-VM(BYOL/PAYG) HA cluster on Alicloud in same zone

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.9
* Terraform Provider Alicloud >= 1.162.0
* Terraform Provider Template >= 2.2.0
* Terraform Provider Random >= 3.1.2


## Deployment overview
Terraform deploys the following components:
   - Alicloud Virtual Network with 3 subnets in same zone
   - Two FortiGate-VM instances with 3 NICs in a-p HA mode.
   - One custom route table, with one default route to FortiGate.

## Deployment
To deploy the FortiGate-VM to Alicloud:
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
ActiveMgmtPIP = "XXX.XXX.XXX.XXX"
ClusterPublicIP = "XXX.XXX.XXX.XXX"
PassiveMgmtPIP = "XXX.XXX.XXX.XXX"
Password = <FGT Password>
Username = "admin"
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
