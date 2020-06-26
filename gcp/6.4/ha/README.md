# Deployment of FortiGate-VM HA on the Google Cloud Platform (GCP)
## Introduction
A Terraform script to deploy FortiGate-VM HA (A-P) on GCP.

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Provider for Google Cloud Platform 2.11.0
* Terraform Provider for Google Cloud Platform Beta 2.13
* Terraform Provider for random 2.2.1
* Terraform Provider for template 2.1.2
* A [GCP service account key](https://cloud.google.com/iam/docs/creating-managing-service-account-keys)

## Deployment overview
Terraform deploys the following components:
   - A Virtual Private Cloud (VPC) with one public subnet
   - A VPC with three private subnets
   - Two FortiGate-VM instances with four NICs
   - Four firewall rules: one for external, one for internal, one for sync, and one for HA management.

## Deployment
To deploy the FortiGate-VM to GCP:
1. Clone the repository.
2. Rename the service account key file to `account.json` and put account.json file to the directory.
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
FortiGate-HA-Cluster-IP = XXX.XXX.XXX.XXX
FortiGate-HA-Master-MGMT-IP = XXX.XXX.XXX.XXX
FortiGate-HA-Slave-MGMT-IP = XXX.XXX.XXX.XXX
FortiGate-Password = <password here>
FortiGate-Username = admin
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
