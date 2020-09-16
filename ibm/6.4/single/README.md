# Deployment of a FortiGate-VM  on the IBM Cloud
## Introduction
A Terraform script to deploy a FortiGate-VM on IBM Cloud

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider IBM >= 1.12.0
  Needs to install the IBM Provider pluging following the link [IBM Setup](https://cloud.ibm.com/docs/terraform?topic=terraform-getting-started)
* Terraform Provider Template >= 2.1.2


## Deployment overview
Terraform deploys the following components:
   - IBM VPC with 2 subnets
   - One FortiGate-VM instance with 2 NICs
   - One security group with inbound and outbound rules

## Deployment
To deploy the FortiGate-VM to IBM cloud:
1. Clone the repository.
2. Customize variables in the `terraform.tfvars` and `variables.tf` file as needed.
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

FGTPublicIP = <FGT Public IP>
Password = <FGT Password>
Username = admin

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
