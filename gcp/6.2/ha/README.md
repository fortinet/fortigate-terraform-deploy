 FortiGate-VM GCP HA deployment
## Description
  A Terraform script to deploy HA(a-p) ForttiGate-VM on Google Cloud Platform

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Terraform Google Provider 2.11.0
* Terraform Google Provider Beta 2.13
* A [GCP service account keys](https://cloud.google.com/iam/docs/creating-managing-service-account-keys)

## Deployment overview
Terraform deploys the following components
   - A VPC with one public subnet
   - A VPC with three private subnets
   - Two FortiGate-VM instances with four nics
   - Four firewall rules, one for external, one for internal, one for sync, one for hamgmt

## Deployment
To deploy the FortiGate-VM GCP:
  1. Clone the repository.
  2. Change to the XXXX directory.  Put the GCP service account key file as account.json in the folder.
     Then, customize the setting in the vars.tf file  and initialize the providers and modules:

     ```sh
     $ cd XXXXX
     $ terraform init
     ```

  3. Submit the Terraform plan using the command below.

     ```sh
     $ terraform plan
     ```

  4. Verify output.
  5. Confirm and apply the plan:

     ```sh
     $ terraform apply
     ```

  6. If output is satisfactory, type `yes`.
  7. After the deployment, user can login to the FortiGate-VM instance via the output information.

     ```sh
     Outputs:
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
