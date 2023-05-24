# AWS Transit Gateway scenario with Terraform
## Introduction
This project gives an example of the usage of the recently (November 2018) announced [AWS Transit Gateway](https://aws.amazon.com/transit-gateway/) product. That component provides a way to interconnect multiple VPCs in a hub-spoke topology.

The Transit Gateway is meant to supersede the more complex and expensive Transit VPC technology. This is a didactic example to showcase how a Transit VPC should be configured to achieve a non-trivial (full mesh) scenario.


## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Terraform Provider AWS 3.63.0
* Terraform Provider Template 2.2.0

## Deployment Overview
A Transit Gateway relies on Route Tables. By default, a new Route Table is created in the Transit Gateway, which populates with the routing info toward every VPC attached to the gateway (the full mesh scenario)
The Terraform code in this project demonstrates a more complex scenario in which traffic is isolated based on the environment.

* VPC-1(10.1.0.0/16): in the 'dev' environment - Spoke1 VPC - 2 subnets
* VPC-2(10.2.0.0/16): in the 'dev' environment - Spoke2 VPC - 2 subnets
* VPC-3(10.3.0.0/16): in the 'shared' environment - Mgmt VPC - 2 subnets
* VPC-4(10.0.0.0/16): in the 'prod' environment - Prod VPC - 8 subnets

Let's assume the 'shared' environment will host shared components, such as proxy services, tools, ... Here are the rules we want our Transit Gateway to implement:
* The shared VPC can access dev and prod VPCs.
* The dev VPCs can access each other, and the shared VPC
* The prod VPCs can only access the shared VPC

To enable such a scenario, three Transit Gateway Route Tables are created.  One Route Table per environment. 

* RouteTable-1 : associated with all subnets in both Spoke1 and Spoke2 VPC.
- RouteTable-2 : associated with all subnets in Mmgmt VPC.
- RouteTable-3 : associated with relay subnets in Prod PC.

* Spoke1/Spoke2/Mgmt VPC each gets a t2.micro Ubuntu instance to validate the network connectivity over ssh and ICMP (ping). 
* The instance in the 'shared' is assigned with a public IP in order to have easy access to the Environment.

![transit-gateway-architecture](./output/transit-gateway.png?raw=true "Transit Gateway Architecture")

## Deployment
* Clone the repository.
* Change ACCESS_KEY and SECRET_KEY values in terraform.tfvars.example.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
* Change parameters in the variables.tf.
* If using SSO, uncomment the token variable in variables.tf and providers.tf
* Initialize the providers and modules:
  ```sh
  $ terraform init
  ```
* Submit the Terraform plan:
  ```sh
  $ terraform plan
  ```
* Verify output.
* Confirm and apply the plan:
  ```sh
  $ terraform apply
  ```
* If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGate-VM instances:
```sh
Outputs:

FGT_Active_MGMT_Public_IP = <Active FGT Management Public IP>
FGT_Cluster_Public_IP = <Cluster Public IP>
FGT_Passive_MGMT_Public_IP = <Passive FGT Management Public IP>
FGT_Password = <FGT Password>
FGT_Username = <FGT admin>
TransitGwy_ID = <Transit Gwy ID>

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
