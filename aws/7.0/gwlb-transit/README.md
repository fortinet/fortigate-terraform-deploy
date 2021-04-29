# Deployment of FortiGate-VM (BYOL/PAYG) on the AWS with GWLB integration and Transit Gateway
## Introduction
A Terraform script to deploy a FortiGate-VM on AWS with Gateway Load Balancer intergration.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.13.5
* Terraform Provider AWS >= 3.22.0
* Terraform Provider Template >= 2.2.0
* FOS Version >= 6.4.4

## Deployment overview
Terraform deploys the following components:
   - 3 AWS VPCs
        - Customer VPC with 2 public subnets and 2 private subnets split two different AZs
           - 1 Internet Gateway
           - 1 Route table with edge association with Internet Gateway, and 2 internal routes with target to Gateway Load Balancer Endpoint.
           - 1 Route table with private subnet association, 1 default route with target to Gateway Load Balancer Endpoint, and 1 route with target to transit gateway.
           - 1 Route table with public subnet association, and default route with target to Internet Gateway.
   - Customer2 VPC with 2 public subnets and 2 private subnets split two different AZs
           - 1 Internet Gateway
           - 1 Route table with edge association with Internet Gateway, and 2 internal route with target to Gateway Load Balancer Endpoint.
           - 1 Route table with private subnet association, 1 default route with target to Gateway Load Balancer Endpoint, and 1 route with target to transit gateway.
           - 1 Route table with public subnet association, and default route with target to Internet Gateway.
        - FGT VPC with 1 public, 1 private, 1 gwlb, and 1 transit gateway subnet in one AZ.  And, have two different AZs. 
           - 1 Internet Gateway
           - 1 Route table with private subnet association.
           - 1 Route table with public subnet association, 1 default route with target to Internet Gateway, 2 customer vpc destinations route with target to Gateway Load Balancer Endpoint.
           - 1 Route table with gwlb subnet association, and 2 customer vpc destination route with target to transit gateway.
           - 1 Route table with transit gateway subnet association, and 1 default with with target to Gateway Load Balancer Endpoint.
   - One FortiGate-VM instance with 2 NICs : port1 on public subnet and port2 on private subnet in one AZ, and another one in different AZ.
           - port2 will be in its own FG-traffic vdom.
           - A geneve interface will be created base on port2 during bootstrap and this will be the interface where traffic will received from the Gateway Load Balancer.
   - Two Network Security Group rules: one for external, one for internal.
   - One Gateway Load Balancer with targets to FortiGates in each AZ.


## Topology overview
Customer VPC (20.1.0.0/16)
       public-az1   (20.1.0.0/24)
       private-az1  (20.1.1.0/24)
       public-az2   (20.1.2.0/24)
       private-az2  (20.1.3.0/24)
Customer 2 VPC (30.1.0.0/16)
       public-az1   (30.1.0.0/24)
       private-az1  (30.1.1.0/24)
       public-az2   (30.1.2.0/24)
       private-az2  (30.1.3.0/24)
FortiGate Security VPC (10.1.0.0/16)
       public-az1   (10.1.0.0/24)
       private-az1  (10.1.1.0/24)
       transit-az1  (10.1.2.0/24)
       gwlb-az1     (10.1.3.0/24)
       public-az2   (10.1.4.0/24)
       private-az2  (10.1.5.0/24)
       transit-az2  (10.1.6.0/24)
       gwlb-az2     (10.1.7.0/24)

FortiGate VM(s) are deployed in Security VPC on both public and private subnet in different AZs.
Server(s) are deployed in the private subnet in the Customer VPC and Customer 2 VPC in different AZs

Ingress traffic to the Server(s) located in the private subnet in Customer VPC/Customer 2 VPC will be routed to GWLB, redirect to FortiGate-VM's geneve interface and send back out to GWLB endpoint.
Egress traffic from the Server(s) located in the private subnet in Customer VPC/Customer 2 VPC will be routed to GWLB and redirect to FortiGate-VM's geneve interface and send back out to GWLB endpoint.
East/West traffic to each Customer VPC will be routed to transit gateway, and to GWLB, redirected to FortiGate-VM's geneve interface, and then back out and to the destinated VPC.

## Deployment
To deploy the FortiGate-VM(s) to AWS:
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
FGT1-Password = <FGT 1 Password>
FGT2-Password = <FGT 2 Password>
FGT2PublicIP = <FGT 2 Public IP>
FGTPublicIP = <FGT 1 Public IP>
FGTVPC = <FGT Security VPC>
LoadBalancerPrivateIP = <Private Load Balancer IP>
LoadBalancerPrivateIP2 = <Private Load Balancer IP>
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
