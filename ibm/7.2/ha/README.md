# Deployment of FortiGate-VMs HA (a-p)  on the IBM Cloud
## Introduction
A Terraform script to deploy FortiGate-VMs HA (a-p) on IBM Cloud

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.9
* Terraform Provider IBM >= 1.36.0
  Needs to install the IBM Provider pluging following the link [IBM Setup](https://cloud.ibm.com/docs/terraform?topic=terraform-getting-started)
* Terraform Provider Template >= 2.2.0


## Deployment overview
Terraform deploys the following components:
   - IBM VPC with 3 subnets - public, private and hasync
   - Two FortiGate-VM instances with 3 NICs
   - One security group with inbound and outbound rules
   - One floating IP for Public IP failing over.
   - One public Gateways for public subnets in the VPC.
   - Two FortiGate-VM instances which will be preconfigured with the necessary ip configurations, ha settings, and sdn connector settings.
   - One route table associated with private subnet with egress route to the private port of active FortiGate-VM.

## Deployment
To deploy the FortiGate-VM HA (a-p) on the IBM cloud:
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
