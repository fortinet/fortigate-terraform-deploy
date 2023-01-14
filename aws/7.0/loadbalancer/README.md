# Deployment of FortiGate-VM (PAYG/BYOL) A-A on the AWS
## Introduction
A Terraform script to deploy a FortiGate-VM A-A on AWS in single AZ with two load balancers.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Terraform Provider >= AWS 3.63.0
* Terraform Provider >= Template 2.2.0


## Deployment overview
Terraform deploys the following components:
   - A AWS VPC with 4 subnets
   - Two FortiGate-VM (PAYG) instances with two NICs in Single AZ.
   - Two Network Security Group rules: one for external, one for internal.
   - Two Route tables: one for internal subnet and one for external subnet.
   - Two Load Balancers: one for external and one for internal.
   - External Load Balancer: Network Load balancer has default rules for port 80 and 443 which will forward traffic to the two FortiGate units. 
   - Internal Load Balancer: Network Load balancer has default rules for port 80 and 443.   User will need to add the target groups for the internal load balancer's target group. 

![loadbalancer-architecture](./loadbalancer.png?raw=true "LoadBalancer Architecture")

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

FGTActivePublicIP = <Active FGT Public IP>
FGTLBPublicFQDN = <External Load Balancer FQDN>
FGTLBPublicIP = <External Load Balancer IP>
FGTPassivePublicIP = <Passive FGT Public IP>
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

