//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

// Availability zone 1 for the region
variable "az1" {
  default = "eu-west-1a"
}

// Availability zone 2 for the region
variable "az2" {
  default = "eu-west-1c"
}

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
}

variable "vpccidr" {
  default = "20.1.0.0/16"
}

variable "publiccidraz1" {
  default = "20.1.0.0/24"
}

variable "privatecidraz1" {
  default = "20.1.1.0/24"
}

variable "hasyncmgmtcidraz1" {
  default = "20.1.2.0/24"
}

variable "publiccidraz2" {
  default = "20.1.10.0/24"
}

variable "privatecidraz2" {
  default = "20.1.11.0/24"
}

variable "hasyncmgmtcidraz2" {
  default = "20.1.12.0/24"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "byol"
}

// instance architect
// Either arm or x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.2.7
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-09abb65279e25827e"
        byol = "ami-0e8dea38debd621bb"
      },
      x86 = {
        payg = "ami-070a34e832cb05296"
        byol = "ami-03dbed661e7bbd936"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0ca72c1d5266b8b8f"
        byol = "ami-0ea2c1f0d0b80cc82"
      },
      x86 = {
        payg = "ami-0171d4c106b7100bb"
        byol = "ami-0462df8ccb6740e0e"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0f78ad17b9dc629f8"
        byol = "ami-01d919015d38b23ea"
      },
      x86 = {
        payg = "ami-0c5225ad04f157f22"
        byol = "ami-0330074a1434f328a"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0c227ae199febd313"
        byol = "ami-0e536efeb3eda0ce7"
      },
      x86 = {
        payg = "ami-0fd005ad379f91d15"
        byol = "ami-0a35d18dd51cff6b9"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-0890e2c32caa2860b"
        byol = "ami-03c1f323354763b42"
      },
      x86 = {
        payg = "ami-0ebf5f6123e7d2cf7"
        byol = "ami-0d668ab86ae796060"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0e82b3108fab351a4"
        byol = "ami-00dcb542c4671d8bb"
      },
      x86 = {
        payg = "ami-0a797b488347f3ab4"
        byol = "ami-0f57207ec501cf09c"
      }
    },
     ap-south-2 = {
      arm = {
        payg = "ami-05040550848a986bf"
        byol = "ami-0506f46e42717aa72"
      },
      x86 = {
        payg = "ami-0fedce546d672f881"
        byol = "ami-007be7714db5ca8dc"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0eb9780e2f3a0d43b"
        byol = "ami-06f8ba3390a2de422"
      },
      x86 = {
        payg = "ami-0b445e91d3507ea96"
        byol = "ami-02d97a7edd26c5116"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-07107b8effeab4832"
        byol = "ami-058096d8fb940079a"
      },
      x86 = {
        payg = "ami-051ab63e87451a94d"
        byol = "ami-048fdfef1519ee868"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-02ef6669b09ae85ed"
        byol = "ami-02dfd98c3f5a710d3"
      },
      x86 = {
        payg = "ami-02c3ae6bfab431f3b"
        byol = "ami-05a27086537497cb2"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0216a3ba2653df8b9"
        byol = "ami-080033ac190010440"
      },
      x86 = {
        payg = "ami-07e3bdc823320977b"
        byol = "ami-05345444641a73526"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0f2c8c54714fccf68"
        byol = "ami-08b3d3db9e9593ebe"
      },
      x86 = {
        payg = "ami-0791e1521e49cef59"
        byol = "ami-026cffc7be0c23231"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-00a7522e4cd999f57"
        byol = "ami-0120a0893807bb36f"
      },
      x86 = {
        payg = "ami-08cd7f3069bf17edb"
        byol = "ami-0bec673d04979bb34"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-09ef2bd25492e1196"
        byol = "ami-04dd344f879f2c0f8"
      },
      x86 = {
        payg = "ami-0b7fbfb87949d0393"
        byol = "ami-0d199a0908293ae69"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-06a6e36a71ce32b80"
        byol = "ami-0f896a3b763318234"
      },
      x86 = {
        payg = "ami-07b569a80ec52d4bd"
        byol = "ami-05d54b2a1a643ddf0"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-021b59c57b252b522"
        byol = "ami-0ba083ca05c27bad0"
      },
      x86 = {
        payg = "ami-0249a2e20b6c62649"
        byol = "ami-01fc2dd1a71c42ee8"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0e37593c6b900bbd9"
        byol = "ami-05163a5ed2c9b43ba"
      },
      x86 = {
        payg = "ami-069010e8ce0aa6dc8"
        byol = "ami-080c1612915e1df7b"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0e6335594e804d01a"
        byol = "ami-040229c8919b9215c"
      },
      x86 = {
        payg = "ami-096bea3ede397ff1f"
        byol = "ami-0920e7a7ca7fd41e1"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-07caf48341f4f4d4b"
        byol = "ami-0be90f2b215f53b2f"
      },
      x86 = {
        payg = "ami-0ff84dc7f452178bd"
        byol = "ami-0f46e00f8e3932bb4"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-00c597150268825cb"
        byol = "ami-04a42a91407695966"
      },
      x86 = {
        payg = "ami-0d37b4aed42b826ce"
        byol = "ami-02a23741a80fe7288"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0037bfd88b2c1415a"
        byol = "ami-074c7fda926b5146d"
      },
      x86 = {
        payg = "ami-0f2e2df92bd5163fb"
        byol = "ami-0f8f886dad77436d1"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-00126aae5e7754e94"
        byol = "ami-08d4b54677aa494a8"
      },
      x86 = {
        payg = "ami-06ddb3c2b8f34880a"
        byol = "ami-0a590892686408551"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-016b2ab33db27b28a"
        byol = "ami-05a2848c541ab06f5"
      },
      x86 = {
        payg = "ami-0d176699c25be2387"
        byol = "ami-07e64a7ba1473e369"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0ae8d2bae217f58bb"
        byol = "ami-0c2781cdfe3802b5a"
      },
      x86 = {
        payg = "ami-0d4ef2a1ee0d23f80"
        byol = "ami-093449a2e05a54c0e"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0dc92e6e5b6495193"
        byol = "ami-0d99d555c950ed014"
      },
      x86 = {
        payg = "ami-0403b8ce60cadcedb"
        byol = "ami-0af4848e587e337a3"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0c0854ef2c24aeced"
        byol = "ami-092a4b04600b9ad49"
      },
      x86 = {
        payg = "ami-04febfef5234e85e7"
        byol = "ami-0e694c867b974e282"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0380f22ef38439663"
        byol = "ami-0b04d6458d30b582e"
      },
      x86 = {
        payg = "ami-07fd920203fd7d59c"
        byol = "ami-0b78e3ada10fa3d5a"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-083fc045881562a62"
        byol = "ami-0728edc81fd05a29d"
      },
      x86 = {
        payg = "ami-09f98669528e5d22e"
        byol = "ami-001077342be69f015"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0c93e507e6a068b88"
        byol = "ami-01a4b0a7ab3f7712b"
      },
      x86 = {
        payg = "ami-096b6c02a972a977b"
        byol = "ami-0c01c53978c035cb3"
      }
    }
  }
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

// HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "activeport1" {
  default = "20.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "20.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "20.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  default = "20.1.10.10"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "20.1.11.10"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "20.1.12.10"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "20.1.0.1"
}

variable "activeport2gateway" {
  default = "20.1.1.1"
}

variable "activeport3gateway" {
  default = "20.1.2.1"
}

variable "passiveport1gateway" {
  default = "20.1.10.1"
}

variable "passiveport2gateway" {
  default = "20.1.11.1"
}

variable "passiveport3gateway" {
  default = "20.1.12.1"
}

variable "bootstrap-active" {
  // Change to your own path
  type    = string
  default = "config-active.conf"
}

variable "bootstrap-passive" {
  // Change to your own path
  type    = string
  default = "config-passive.conf"
}

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.lic"
}

