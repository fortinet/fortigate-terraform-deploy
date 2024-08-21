# Deployment of a FortiGate-VM (BYOL) on the AWS with GWLB integration with multiple VPC in multiple tenants setup
## Introduction
A Terraform script to deploy a FortiGate-VM on AWS with Gateway Load Balancer intergration with multiple VPC with multiple tenants setup.
Each VPC's traffic will be separate into its own VDOM. 
It's best to use BYOL license due to the need of VDOM for each VPC.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Terraform Provider AWS >= 3.63.0
* Terraform Provider Template >= 2.2.0
* FOS Version >= 7.0.4

## Deployment overview
Terraform deploys the following components:
   * 3 AWS VPCs
     - Customer 1 VPC with 2 public subnets and 2 private subnets split two different AZs
       - 1 Internet Gateway
       - 1 Route table with edge association with Internet Gateway, and 2 internal route with target to Gateway Load Balancer Endpoint.
       - 1 Route table with private subnet association, and default route with target to Gateway Load Balancer Endpoint.
       - 1 Route table with public subnet association, and default route with target to Internet Gateway.
	 * Customer 2 VPC with 2 public subnets and 2 private subnets split two different AZs
       - 1 Internet Gateway
       - 1 Route table with edge association with Internet Gateway, and 2 internal route with target to Gateway Load Balancer Endpoint.
       - 1 Route table with private subnet association, and default route with target to Gateway Load Balancer Endpoint.
       - 1 Route table with public subnet association, and default route with target to Internet Gateway.
       - FGT VPC with 1 public and 1 private subnet in one AZ. 
       - 1 Internet Gateway
       - 1 Route table with private subnet association, and default route with target to FortiGate private port.
       - 1 Route table with public subnet association, and default route with target to Internet Gateway. 
   * One FortiGate-VM instance with 2 NICs : port1 on public subnet and port2 on private subnet
     - port2 will be in its own FG-traffic vdom.
     - A geneve interface will be created base on port2 during bootstrap and this will be the interface where traffic will received from the Gateway Load Balancer.
   - Two Network Security Group rules: one for external, one for internal.
   - One Gateway Load Balancer with single target to one FortiGate.
        

## Topology overview
* Customer VPC (20.1.0.0/16)  
  - public-az1   (20.1.0.0/24)
  - private-az1  (20.1.1.0/24)
  - public-az2   (20.1.2.0/24)
  - private-az2  (20.1.3.0/24)
* Customer 2 VPC (21.1.0.0/16)  
  - public-az1   (21.1.0.0/24)
  - private-az1  (21.1.1.0/24)
  - public-az2   (21.1.2.0/24)
  - private-az2  (21.1.3.0/24)
* Security VPC (10.1.0.0/16)
  - public       (10.1.0.0/24)
  - private      (10.1.1.0/24)

FortiGate VM is deployed in Security VPC on both public and private subnet
Server(s) are deployed in the private subnet in each of the Customer VPC in different AZ.

Ingress traffic to the Server(s) located in the private subnet in Customer VPC will be routed to GWLB, redirect to FortiGate-VM's geneve interface and send back out to GWLB endpoint.
Egress traffic from the Server(s) located in the private subnet in Customer VPC will be routed to GWLB and redirect to FortiGate-VM's geneve interface and send back out to GWLB endpoint. 

![gwlb-multitenant-architecture](./aws-gwlb-multitenant.png?raw=true "GWLB Multitenant Architecture")

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

Customer2VPC = <Customer 2 VPC>
CustomerVPC = <Customer VPC>
FGTPublicIP = <FGT Public IP>
FGTVPC = <FGT VPC>
LoadBalancerPrivateIP = <Load Balancer Private IP>
Password = <FGT Password>
Username = <FGT Username>
VPCEndpoint1 = <VPCEndpoint for Customer 1>
VPCEndpoint2 = <VPCEndpoint for Customer 2>

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



