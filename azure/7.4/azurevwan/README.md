# Deployment of a Azure VWAN on Azure
## Introduction
A Terraform script to deploy a Azure VWan and VPN connection with on-premise FortiGate.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider AzureRM >= 2.87.0
* Terraform Provider FortiOS >= 1.13.2
* FortiGate API Key for configuration.


## Deployment overview
Terraform deploys the following components:
   - Azure Virtual Network with 2 subnets
   - Azure VWan
   - Azure VWan Hub
   - Azure VPN Site with connection to On-Premise FortiGate
   - Azure VWan virtual network connections to a virtual network
   - Configuring the IPSEC, BGP and related configurations to the On-Premise FortiGate

## Deployment
To deploy the topology to Azure:
1. Clone the repository.
2. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`
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

azurerm_vpn_gateway_id = "XXXXXX"
azurerm_vpn_tunnel2_private_ip = "X.X.X.X"                                                                                                    
azurerm_vpn_tunnel2_public_ip = "X.X.X.X"                                          
azurerm_vpn_tunnel_private_ip = "X.X.X.X"                               
azurerm_vpn_tunnel_public_ip = "X.X.X.X"    
```

## Destroy the instance
To destroy the instance, use the command:
```sh
$ terraform destroy
```

## Verify the deployment
After deployment, the BGP route should be populate via the ipsec tunnel
```
get router info routing-table  details 
Codes: K - kernel, C - connected, S - static, R - RIP, B - BGP
       O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default

Routing table for VRF=0
:
B       10.0.0.0/16 [20/0] via 10.0.0.13 (recursive via vwan2ipsec1 tunnel 20.96.65.233), 00:01:16
                                         (recursive via vwanipsec1 tunnel 20.96.66.55), 00:01:16
:
B       20.0.0.0/16 [20/0] via 10.0.0.13 (recursive via vwan2ipsec1 tunnel 20.96.65.233), 00:01:16
                                         (recursive via vwanipsec1 tunnel 20.96.66.55), 00:01:16
```

# Support
Fortinet-provided scripts in this and other GitHub projects do not fall under the regular Fortinet technical support scope and are not supported by FortiCare Support Services.
For direct issues, please refer to the [Issues](https://github.com/fortinet/fortigate-terraform-deploy/issues) tab of this GitHub project.
For other questions related to this project, contact [github@fortinet.com](mailto:github@fortinet.com).

## License
[License](https://github.com/fortinet/fortigate-terraform-deploy/blob/master/LICENSE) © Fortinet Technologies. All rights reserved.

