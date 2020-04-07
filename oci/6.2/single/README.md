# Deployment of a single FortiGate-VM on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a single FortiGate-VM on OCI

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI 3.67.0
* Terraform Provider Template 2.1.2
* A [OCI API key](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)

## Deployment overview
Terraform deploys the following :
   - A Virtual Cloud Network (VCN) with one public subnet
   - A VCN with one private subnet
   - A FortiGate-VM instance with two NICs, one in each subnet
   - Two firewall rules: one for the external subnet, and one for the internal subnet

## Deployment
To deploy the FortiGate-VM to OCI:
1. Clone the repository.
2. Move the OCI API key and FortiGate-VM license file to the same folder
3. Customize variables in the `terraform.tfvars` and `variables.tf` file as needed.
5. Initialize the providers and modules:
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
Outputs:

Default_Password = [
  "<FGT Password>",
]
Default_Username = admin
PublicIP = [
  "<FGT Public IP>",
]

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


## Application Catalog/Image ID for deployment
Marketplace Catalog for mp_listing_id
BYOL 6.2.3: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
4 VCPU PAYG 6.2.3: ocid1.appcataloglisting.oc1..aaaaaaaavvijdvafj64pj5y45k7qgda2um7qdsunr6snzl2456s5isvyuaoq
8 VCPU PAYG 6.2.3: ocid1.appcataloglisting.oc1..aaaaaaaa7tisnaxmdgiueows3npda5sn4ytpljbzblsqbsvrxn2wkszwfl7q
24 VCPU PAYG 6.2.3: ocid1.appcataloglisting.oc1..aaaaaaaaamljd4acqky2pry2bxexyus4rcdze25pdprpoei6ca3tcsh45oba

Marketplace Image for mp_listing_resource_id
BYOL 6.2.3: ocid1.image.oc1..aaaaaaaaxyhftjifo6rjz4i76tv2odlcczxhlmfkacd5cap6f6luuhbksiua
4 VCPU PAYG 6.2.3: ocid1.image.oc1..aaaaaaaacdjk2ctbrzeugcpkqkqwq3jaj3lnyp6t6gukfhje5kxdkzdaogsq
8 VCPU PAYG 6.2.3: ocid1.image.oc1..aaaaaaaaruehlwmhkk5mle4b5u7erbs4tlxh5shnegjzm5thehmizwnr6coq
24 VCPU PAYG 6.2.3: ocid1.image.oc1..aaaaaaaaktd4szgqrz6izp2up66a7euejphhhon3zi4detp2nztz2itxsxca

