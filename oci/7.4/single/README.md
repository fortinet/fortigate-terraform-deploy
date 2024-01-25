# Deployment of a single FortiGate-VM on the Oracle Cloud Infrastructure (OCI)
## Introduction
A Terraform script to deploy a single FortiGate-VM on OCI

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider OCI >= 3.86.0
* Terraform Provider Template >= 2.1.2
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
x86
BYOL 7.4.2: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.2 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.2 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.2 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.2 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.2 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.4.2:  ocid1.image.oc1..aaaaaaaaydhtoikm7qitqvsuhq435asbcggdhp6vwook73ct4b3h7yqigo3a
PAYG 7.4.2 2ocpu: ocid1.image.oc1..aaaaaaaapr46d7efbcsws4oqdxyn34oke52mizpb3r3jd6otmkpbd4irkb5a
PAYG 7.4.2 4ocup: ocid1.image.oc1..aaaaaaaaxrtwvf662z6cyc7tmqdziczaxhsw3lauht2nsobjii2nzwmdid4q
PAYG 7.4.2 8ocup: ocid1.image.oc1..aaaaaaaa4qkthjuokxnpimykv7exflqjsekxyudzqg4inbw7z6syrcxwzlua
PAYG 7.4.2 16ocup: ocid1.image.oc1..aaaaaaaajijjfl3bnhursqvguuwqm4ha2bs6a3ovjxho33zj2te2cxq5b36q
PAYG 7.4.2 24ocup: ocid1.image.oc1..aaaaaaaa7hquc4wqt2rdjsaihy3qtewtntu4upa2sp62o2fvdfugm4eerdwq


ARM
BYOL 7.4.2: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.2 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.2 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.2 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.2 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.2 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.4.2: ocid1.image.oc1..aaaaaaaalmipldxavqwtaogyaxwlyv6aa6ijviqt4x4dqpl2wmvnzjuiuwda
PAYG 7.4.2 2ocpu: ocid1.image.oc1..aaaaaaaazcokz7v3zrjv5fxoiogm7scpm7mgofuivafo5bxxeo3nepwtrlqq
PAYG 7.4.2 4ocup: ocid1.image.oc1..aaaaaaaawhin62aoexjb6mkdei3isfj7on2xfidmnr6zccmvk37zzrulgwpa
PAYG 7.4.2 8ocup: ocid1.image.oc1..aaaaaaaaehrqvxhxhz3tfxnhncap4n574aqzlbshvbqpvaqvuofnoz7q2nra
PAYG 7.4.2 16ocup: ocid1.image.oc1..aaaaaaaadyuwg4gx7ve5ehwma7pwjs7vv5pglhqomckg7xcdqbwvyv76764a
PAYG 7.4.2 24ocup: ocid1.image.oc1..aaaaaaaaitk5a64pvazc7keovgvmhcyofzy6327zlj3kvwyhtlairjlz5qvq
