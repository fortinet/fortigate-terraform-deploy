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
BYOL 7.4.4: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.4 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.4 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.4 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.4 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.4 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.4.4:  ocid1.image.oc1..aaaaaaaaqtn5zzxeq2umyspk72ge7byv4sdrmuyz2moera44ms2d3i66ge5a
PAYG 7.4.4 2ocpu: ocid1.image.oc1..aaaaaaaacpburqahlsonu65tjpe35ebs3zocjbl3rkxqueifc4fmgknchhrq
PAYG 7.4.4 4ocup: ocid1.image.oc1..aaaaaaaa5gjppe75polatsasipzuv3g5x7ectgrlybocfbojr4izqhpsxega
PAYG 7.4.4 8ocup: ocid1.image.oc1..aaaaaaaarcaxxtxyfi6i6tj4ukkxaa3un4xmjriznhrmcrly4rlvcye43faq
PAYG 7.4.4 16ocup: ocid1.image.oc1..aaaaaaaarmoubcdil5nhouymlsgbvdxyzmxcfxnrogejehwtmfppwbski2eq
PAYG 7.4.4 24ocup: ocid1.image.oc1..aaaaaaaadx2vibovdtqd5b5hpvnrkbwkplqdy52kq5o246ggy3m7p3lveppq


Marketplace Catalog for mp_listing_id in variables.tf
ARM
BYOL 7.4.4:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
PAYG 7.4.4 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
PAYG 7.4.4 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
PAYG 7.4.4 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
PAYG 7.4.4 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
PAYG 7.4.4 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

Marketplace Image for mp_listing_resource_id in variables.tf
BYOL 7.4.4:  ocid1.image.oc1..aaaaaaaalcoyndcss27grmh4vwaw56wmwupx6dgilfecvcs6evhrqz2glpcq
PAYG 7.4.4 2ocpu:  ocid1.image.oc1..aaaaaaaasb4t6k2mwv6pis3lwpkjlklctyq525pmnug66476oo4rr6acoxra
PAYG 7.4.4 4ocup:  ocid1.image.oc1..aaaaaaaafym7xlmnjuadlbdggjfpw7hidqfuduyj7czast2we5cdqy7lggaq
PAYG 7.4.4 8ocup:  ocid1.image.oc1..aaaaaaaauybk4ksm3mru3bfuyzx77r3ster2ne3niksdp52rklvpmr5r6eta
PAYG 7.4.4 16ocup:  ocid1.image.oc1..aaaaaaaaan5gyn535gk4beydy3cfpbigd4cn2e6nobtyuvvdwci4vnj33f3q
PAYG 7.4.4 24ocup: ocid1.image.oc1..aaaaaaaagbrmmqrksh4g4xwxvaqe2ppr34ugfteovr7m7zjwhhhfz4ho5nea
