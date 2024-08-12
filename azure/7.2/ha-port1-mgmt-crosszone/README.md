# Deployment of a FortiGate-VM (BYOL/PAYG) Cluster on Azure in different zones

## Introduction

## This topology is only recommended for using with FOS 6.4.2 and later.

## port1 - hamgmt

## port2 - public/untrust

## port3 - private/trust

## port4 - hasync

A Terraform script to deploy a FortiGate-VM Cluster on Azure

## Requirements

* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider AzureRM >= 2.24.0
* Terraform Provider Template >= 2.2.0
* Terraform Provider Random >= 3.1.0

## Deployment overview

Terraform deploys the following components:

* Azure Virtual Network with 4 subnets
* Two FortiGate-VM (BYOL/PAYG) instances with four NICs.  Each FortiGate-VM reside in different zones.
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

## Requirements and limitations

The terms for the FortiGate PAYG or BYOL image in the Azure Marketplace needs to be accepted once before usage. This is done automatically during deployment via the Azure Portal. For the Azure CLI the commands below need to be run before the first deployment in a subscription.

```sh
BYOL az vm image terms accept --publisher fortinet --offer fortinet_fortigate-vm_v5 --plan fortinet_fg-vm
PAYG az vm image terms accept --publisher fortinet --offer fortinet_fortigate-vm_v5 --plan fortinet_fg-vm_payg_2023
```

##Fabric Connector

The FortiGate-VM uses Service Principal for the SDN Fabric Connector. A SDN Fabric Connector is created automatically during deployment.  User needs to configure the Azure Service Principal prior to the deployment.  More information can be found on the [Fortinet Documentation Libary](https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/azure-administration-guide/948968).

## Support

Fortinet-provided scripts in this and other GitHub projects do not fall under the regular Fortinet technical support scope and are not supported by FortiCare Support Services.
For direct issues, please refer to the [Issues](https://github.com/fortinet/fortigate-terraform-deploy/issues) tab of this GitHub project.
For other questions related to this project, contact [github@fortinet.com](mailto:github@fortinet.com).

## License

[License](https://github.com/fortinet/fortigate-terraform-deploy/blob/master/LICENSE) © Fortinet Technologies. All rights reserved.
