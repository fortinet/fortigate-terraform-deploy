# Deployment of FortiGate-VM (BYOL/PAYG) on the AWS with AWS Transit Gateway Connect integration
## Introduction
A Terraform script to deploy a FortiGate-VM on AWS with Transit Gateway Connect.  It will create GRE tunnel with the Transit Gateway Connect attachment.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Terraform Provider AWS >= 3.63.0
* Terraform Provider Template >= 2.2.0
* FOS Version >= 7.0

## Deployment overview
Terraform deploys the following components:
   - 3 AWS VPCs
        - Customer VPC with 1 app subnet 
           - 1 Internet Gateway
           - 1 Route table with app subnet association, and default route with target to Transit Gateway.
        - Customer VPC with 1 app subnet 
           - 1 Internet Gateway
           - 1 Route table with app subnet association, and default route with target to Transit Gateway.
        - FGT VPC with 1 public, 1 private, 1 gwlb, and 1 transit gateway subnet in one AZ.  And, have two different AZs. 
           - 1 Internet Gateway
           - 1 Route table with private subnet association.
           - 1 Route table with public subnet association, 1 default route with target to Internet Gateway.
           - 1 Route table with transit gateway subnet association.
   - One FortiGate-VM instance with 2 NICs : port1 on public subnet and port2 on private subnet in one AZ.
           - A GRE interface will be created to connect with the Transit Gateway connect.
   - Two Network Security Group rules: one for external, one for internal.
   - One Transit Gateway 
           - Connect attachment to FGT VPC.
           - VPC attachment to FGT VPC(fgt transit subnet az1).
           - VPC attachment to Customer VPC(cs app subnet az1).
           - VPC attachment to Customer2 VPC(cs2 app subnet az1).

## Topology overview
Customer VPC (192.168.50.0/24)
       cs app subnet az1  (192.168.50.128/25)
Customer 2 VPC (192.168.100.0/24)
       cs2 app subnet az1  (192.168.100.128/25)
FortiGate Security VPC (10.0.0.0/24)
       fgt public subnet az1   (10.0.0.0/28)
       fgt private subnet az1  (10.0.0.16/28)
       fgt transit subnet az1  (10.0.0.32/28)

FortiGate VM is deployed in Security VPC.
Server(s) deployed in the app subnet in the Customer VPC and Customer 2 VPC.

Ingress traffic to the Server(s) located in the App subnet in Customer VPC/Customer 2 VPC will be routed to FGT in the security VPC. 
Egress traffic(North/South) from the Server(s) located in the App subnet in Customer VPC/Customer 2 VPC will be routed to Transit Gateway, then through Connect, and redirect to FortiGate-VM's gre interface and send back out to port1.
East/West traffic between each Customer VPC will be routed to the transit gateway, and then through Connect.  Then redirected to FortiGate-VM's GRE interface, and then back out the GRE interface, then to the destinated VPC.

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

Customer2VPC = "<Customer 2 VPC>"
CustomerVPC = "<Customer 1 VPC>"
FGT-Password = "<FGT Password>"
FGTPublicIP = "<FGT Public IP>"
FGTVPC = "<FGT Security VPC>"
TransitGwy = "<Transit Gateway ID>"
Username = "<FGT Username>"

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
