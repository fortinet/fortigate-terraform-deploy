# Deployment of a FortiGate-VM (BYOL/PAYG) Cluster on the Azure in different zones with 3 ports

## Introduction

## This topology is only recommended for using with FOS 7.0.5 and later.

## Since it needs FOS 7.0 that supports 3 ports only HA setup

## port1 - hamgmt/hasync

## port2 - public/untrust

## port3 - private/trust

A Terraform script to deploy a FortiGate-VM Cluster on Azure

## Requirements

* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider AzureRM >= 2.24.0
* Terraform Provider Template >= 2.2.0
* Terraform Provider Random >= 3.1.0

## Deployment overview

Terraform deploys the following components:

* Azure Virtual Network with 3 subnets
* Two FortiGate-VM (BYOL/PAYG) instances with three NICs.  Each FortiGate-VM reside in different zones.
* Two firewall rules.
* A Ubuntu Client instance.

## Deployment

To deploy the FortiGate-VM to Azure:

1. Clone the repository.
2. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
3. Initialize the providers and modules:

   ```sh
   cd XXXXX
   terraform init
    ```

4. Submit the Terraform plan:

   ```sh
   terraform plan
   ```

5. Verify output.
6. Confirm and apply the plan:

   ```sh
   terraform apply
   ```

7. If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGate-VM instances:

```sh
Outputs:

ActiveMGMTPublicIP = <Active FGT Management Public IP>
ClusterPublicIP = <Cluster Public IP>
PassiveMGMTPublicIP = <Passive FGT Management Public IP>
Password = <FGT Password>
ResourceGroup = <Resource Group>
Username = <FGT admin>
```

## Destroy the instance

To destroy the instance, use the command:

```sh
terraform destroy
```

## Support

Fortinet-provided scripts in this and other GitHub projects do not fall under the regular Fortinet technical support scope and are not supported by FortiCare Support Services.
For direct issues, please refer to the [Issues](https://github.com/fortinet/fortigate-terraform-deploy/issues) tab of this GitHub project.
For other questions related to this project, contact [github@fortinet.com](mailto:github@fortinet.com).

## License

[License](https://github.com/fortinet/fortigate-terraform-deploy/blob/master/LICENSE) © Fortinet Technologies. All rights reserved.
