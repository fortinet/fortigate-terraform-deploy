# Deployment of two FortiGate-VMs (BYOL/PAYG) on the AWS with GWLB integration in Cross-AZ scenario
## Introduction
A Terraform script to deploy two FortiGate-VMs in two different AZs on AWS with Gateway Load Balancer intergration.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Terraform Provider AWS >= 3.63.0
* Terraform Provider Template >= 2.2.0
* FOS Version >= 6.4.4

## Deployment overview
Terraform deploys the following components:
   * 2 AWS VPCs
        - Customer VPC with 2 public subnets and 2 private subnets split two different AZs
           - 1 Internet Gateway
           - 1 Route table with edge association with Internet Gateway, and 2 internal route with target to Gateway Load Balancer Endpoint.
           - 2 Route table with private subnets association for each AZ, and default route with target to ieach AZ's Gateway Load Balancer Endpoint.
           - 1 Route table with public subnet association, and default route with target to Internet Gateway.
        - FGT VPC with 2 public and 2 private subnet in two different AZs. 
           - 1 Internet Gateway
           - 2 Route table with private subnets association for each AZ, and default route with target to each AZ's FortiGate private port.
           - 1 Route table with public subnets association, and default route with target to Internet Gateway. 
   * Two FortiGate-VM each instance with 2 NICs
     - port1 on public subnet and port2 on private subnet in different AZ.
     - port2 will be in its own FG-traffic vdom.
     - A geneve interface will be created base on port2 during bootstrap and this will be the interface where traffic will received from the Gateway Load Balancer.
   * Two Network Security Group rules: one for external, one for internal.
   * One Gateway Load Balancer with two targets to two FortiGates.
        

## Topology overview
Customer VPC (20.1.0.0/16)  
   * public-az1   (20.1.0.0/24)
   * private-az1  (20.1.1.0/24)
   * public-az2   (20.1.2.0/24)
   * private-az2  (20.1.3.0/24)
   
Security VPC (10.1.0.0/16)
   * public-az1   (10.1.0.0/24)
   * private-az1  (10.1.1.0/24)
   * public-az2   (10.1.2.0/24)
   * private-az2  (10.1.3.0/24)

FortiGate VMs are deployed in Security VPC on both public and private subnet
One FortiGate VM is deployed in AZ 1, while another one is deployed in AZ 2. 
Server(s) are deployed in the private subnet in the Customer VPC in different AZ.

Ingress traffic to the Server(s) located in the private subnet in Customer VPC will be routed to GWLB, redirect to FortiGate-VM's geneve interface and send back out to GWLB endpoint.
Egress traffic from the Server(s) located in the private subnet in Customer VPC will be routed to GWLB and redirect to FortiGate-VM's geneve interface and send back out to GWLB endpoint. 

![gwlb-az-architecture](./aws-gwlb-crossaz.png?raw=true "GWLB Architecture")

## Deployment
To deploy the FortiGate-VMs to AWS:
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

CustomerVPC = <Customer VPC>
FGT1PublicIP = <FGT1 Public IP>
FGT2PublicIP = <FGT2 Public IP>
FGTVPC = <FGT VPC>
LoadBalancerPrivateIP = <Private Load Balancer IP>
Password_for_FGT1 = <FGT1 Password>
Password_for_FGT2 = <FGT2 Password>
Username = <FGT Username>

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
