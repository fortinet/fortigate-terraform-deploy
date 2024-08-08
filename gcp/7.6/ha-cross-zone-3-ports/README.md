# Deployment of FortiGate-VM HA on the Google Cloud Platform (GCP)
## Introduction
A Terraform script to deploy FortiGate-VM HA (A-P) with 3 ports on GCP in different zones.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider for Google Cloud Platform 2.11.0
* Terraform Provider for Google Cloud Platform Beta 2.13
* Terraform Provider for random 2.2.1
* Terraform Provider for template 2.1.2
* A [GCP OAuth2 access token](https://developers.google.com/identity/protocols/OAuth2)

## Deployment overview
Terraform deploys the following components:
   - A Virtual Private Cloud (VPC) with one public subnet
   - A VPC with two private subnets
   - Two FortiGate-VM instances with three NICs in different zones
   - Four firewall rules: one for external, one for internal, and one for sync/hamgmt.
   - 4 public static address.  1 for cluster ip, 1 for active hamgmt, 1 for passive hamgmt, and 1 for forwarding rule.
   - One internal route associate to the private subnet
   - One forwarding rule with two different target groups.  Each target group points to the FortiGates in each AZ.
   - During the HA failover, cluster ip, internal route, and forwarding rule will fail from the active unit to the passive unit.  

## Deployment
To deploy the FortiGate-VM HA Clusterto GCP:
1. Clone the repository.
2. Obtain a GCP OAuth2 token and input it in the vars.tf file.
3. Customize variables in the `vars.tf` file as needed.
4. Initialize the providers and modules:
   ```sh
   $ cd XXXXX
   $ terraform init
    ```
5. Submit the Terraform plan:
   ```sh
   $ terraform plan
   ```
6. Verify output.
7. Confirm and apply the plan:
   ```sh
   $ terraform apply
   ```
8. If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGate-VM instances:
```sh
FortiGate-HA-Active-MGMT-IP = XXX.XXX.XXX.XXX
FortiGate-HA-Cluster-IP = XXX.XXX.XXX.XXX
FortiGate-HA-Passive-MGMT-IP = XXX.XXX.XXX.XXX
FortiGate-Password = <password here>
FortiGate-Username = admin
Fowarding-IP-Address = "XXX.XXX.XXX.XXX"
```
*After deployment, user can add extra forwarding rule if needs to have extra public ip forwarding traffic to FortiGate-VM instances. User would need to configure the VIP to use with the forwarding rule.*

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
