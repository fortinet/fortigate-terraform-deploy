# Deployment of a single FortiGate-VM on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a single FortiGate-VM on OCI

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI >= 4.24.0
* Terraform Provider Template >= 2.2.0
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
3. Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed.  And rename `terraform.tfvars.example` to `terraform.tfvars`.
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
Marketplace Catalog for mp_listing_id in variables.tf
BYOL 7.0.5: ocid1.image.oc1..aaaaaaaasqn4zerim4l4mmmilnmcj5npl7mam7abpzekiwsyoc5b7plevula

Marketplace Image for mp_listing_resource_id in variables.tf
PAGY 7.0.5 2ocpu:   ocid1.image.oc1..aaaaaaaawgn5temqec6xugvkkjq2jkfajize4xfqhuqjdqas5f7xoos4uaeq
PAYG 7.0.5 4ocup:   ocid1.image.oc1..aaaaaaaa6o5ei4jk33visyihcdpetxkxis5qzslgdememby3zpj4z4zrt5fq
PAYG 7.0.5 8ocup:   ocid1.image.oc1..aaaaaaaa6s77gb5kffqac7i6imixpbdi7p2w3oay6nkwx26e75a6dr6ccqwq
PAYG 7.0.5 24ocup:  ocid1.image.oc1..aaaaaaaaaaeldzv7bqtfbxkxmf6tvoh5ex7memrvjbenuposqu5d4jliu2xq
