# Deployment of FortiGate-VMs on the IBM Cloud with two load balancers
## Introduction
A Terraform script to deploy FortiGate-VMs on IBM Cloud two with load balancers

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
   - One Public IP address on each of the instances's port1
   - One public Gateways for public subnets in the VPC.
   - Two FortiGate-VM instances which will be preconfigured with the necessary ip configurations and autos-scale settings..
   - One External load balancer, and one internal load balancer.
   - One route table associated with private subnet with egress route to the private ip of internal load balancer

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

FGTLBPublicIP = "<LB Public IP>"
Password = "<FGT Password>"
Username = "admin"
fgt2publicip = "<FGT1 Public IP>"
fgtpublicip = "<FGT2 Public IP>"

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
