//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

// Availability zones for the region
variable "az1" {
  default = "eu-west-1a"
}

variable "az2" {
  default = "eu-west-1b"
}

// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM Role>"
}

// VPC for FortiGate Security VPC
variable "vpccidr" {
  default = "10.0.0.0/24"
}

variable "publiccidraz1" {
  default = "10.0.0.0/28"
}

variable "privatecidraz1" {
  default = "10.0.0.16/28"
}

variable "attachcidraz1" {
  default = "10.0.0.32/28"
}

variable "hasynccidraz1" {
  default = "10.0.0.48/28"
}

variable "publiccidraz2" {
  default = "10.0.0.64/28"
}

variable "privatecidraz2" {
  default = "10.0.0.80/28"
}

variable "attachcidraz2" {
  default = "10.0.0.96/28"
}

variable "hasynccidraz2" {
  default = "10.0.0.112/28"
}

variable "fgtport1ip" {
  default = ["10.0.0.5"]
}

variable "fgtport2ip" {
  default = ["10.0.0.21"]
}

variable "fgtport3ip" {
  default = ["10.0.0.54"]
}

variable "fgt2port1ip" {
  default = ["10.0.0.70"]
}

variable "fgt2port2ip" {
  default = ["10.0.0.86"]
}

variable "fgt2port3ip" {
  default = ["10.0.0.118"]
}

// VPC for Customer VPC
variable "csvpccidr" {
  default = "192.168.50.0/24"
}

variable "csprivatecidraz1" {
  default = "192.168.50.128/25"
}

// VPC for Customer2 VPC
variable "cs2vpccidr" {
  default = "192.168.100.0/24"
}

variable "cs2privatecidraz1" {
  default = "192.168.100.128/25"
}

// instance architect
// Either arm or x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5.xlarge"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// AMIs for FGTVM-7.4.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-053c935b698f02899"
        byol = "ami-04ce66e78ff5a4ef6"
      },
      x86 = {
        payg = "ami-069777173bc107452"
        byol = "ami-023b1987e16a18b60"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0334d602c0ed7d0b1"
        byol = "ami-0a1e00c98ae19897c"
      },
      x86 = {
        payg = "ami-0599d618948826eb2"
        byol = "ami-025c7ab2a8a1dfa49"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-09bd9c33d04bcdf4a"
        byol = "ami-00c571443372aa6a8"
      },
      x86 = {
        payg = "ami-0153df6ede9484eb2"
        byol = "ami-0124eb8ef6e5c283a"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-03344bf5eb5fc9e0a"
        byol = "ami-0e3a7847a9aa624eb"
      },
      x86 = {
        payg = "ami-0a62643a3c57dacb3"
        byol = "ami-0d777364299515223"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-01cd00b91977299bb"
        byol = "ami-0b1c5f6533484a70c"
      },
      x86 = {
        payg = "ami-07cfbecd499c1e704"
        byol = "ami-0f97cab8731ce41f3"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0a025e35db43b00f1"
        byol = "ami-04a7bc962fdd19bbf"
      },
      x86 = {
        payg = "ami-0acd179b8cb3f6b22"
        byol = "ami-0afa71336fdf0e681"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-00d27eba74ab90870"
        byol = "ami-0bdce6887321db07f"
      },
      x86 = {
        payg = "ami-0a419bb20bd64aceb"
        byol = "ami-0b08d78d60fa4cd71"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0aa106972a8b34a46"
        byol = "ami-01830e93b72325481"
      },
      x86 = {
        payg = "ami-0fe1f21464892deef"
        byol = "ami-0823a3569f30af8f8"
      }
    },
    ap-south-4 = {
      arm = {
        payg = "ami-0af4f1b3e1b1044cb"
        byol = "ami-0cbcf8f2ad29b2de8"
      },
      x86 = {
        payg = "ami-02c59ea0f1fdd9d3e"
        byol = "ami-0920a1b3d41bc8f71"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-00e831ee476364b78"
        byol = "ami-09df150b12917a755"
      },
      x86 = {
        payg = "ami-034c9d5ff899d3f2a"
        byol = "ami-0afcb1664e5e8c725"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0a90188f24033ae33"
        byol = "ami-08128b71709e6992f"
      },
      x86 = {
        payg = "ami-0fffb4a7f1c1ca9d6"
        byol = "ami-0acc5c073ded421e6"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0dec8836cbc591c10"
        byol = "ami-099aaf5111a810d59"
      },
      x86 = {
        payg = "ami-0c68a68a3575014ad"
        byol = "ami-0ab05da220c15bcf0"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-09bf4f13a0a48a9e9"
        byol = "ami-0b712c3adff6167d3"
      },
      x86 = {
        payg = "ami-0d4e0ff377dd74db3"
        byol = "ami-0c3f47755ba6939f2"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-01d26e7f4fb9959cb"
        byol = "ami-0984b76f236478424"
      },
      x86 = {
        payg = "ami-09629d072489a5772"
        byol = "ami-0d31fcf38f166e16d"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0cfc9ce281bd6be3f"
        byol = "ami-0884d6ac05818ebe7"
      },
      x86 = {
        payg = "ami-09172aeaf9b4df8c1"
        byol = "ami-018f653c813584b08"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-04bb2460da5872b09"
        byol = "ami-0a2849369784ec679"
      },
      x86 = {
        payg = "ami-0e04ba5054ca4da5b"
        byol = "ami-0cd2ce40017e2f5a2"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-09f5d58b1871ec3ec"
        byol = "ami-06cdbd403c84d9149"
      },
      x86 = {
        payg = "ami-01bd410bcaa617f44"
        byol = "ami-006569d5876e72b08"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0e7e5bcec5354aa8b"
        byol = "ami-09d8f034dadcd3df1"
      },
      x86 = {
        payg = "ami-0dd7de3ea96419dbd"
        byol = "ami-06b664d1b3aca5a87"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0e17ce19a0e15caa5"
        byol = "ami-0a43904906c39bb05"
      },
      x86 = {
        payg = "ami-03471a82df55ecce4"
        byol = "ami-0b8481a08fe6afec4"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0e8cba4ab3b5144de"
        byol = "ami-0a3088f8ae59f7b28"
      },
      x86 = {
        payg = "ami-0b0d88d7406eb6435"
        byol = "ami-0aec89d42c6e6e761"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-069b42fb2a9307a7f"
        byol = "ami-07dc962d73c169e1f"
      },
      x86 = {
        payg = "ami-04fb7eaa45bcdf668"
        byol = "ami-05e0c4faa4d24ab58"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-092e8c8ba847d59ae"
        byol = "ami-046525f54a600dce5"
      },
      x86 = {
        payg = "ami-0d13fadc5438f6201"
        byol = "ami-097a6056577d66e68"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0c5b00356602179b1"
        byol = "ami-034bd7dabae6b987b"
      },
      x86 = {
        payg = "ami-026697e3f2e27cc14"
        byol = "ami-0eca84214d4cf6895"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0a9f05d091fc1c25f"
        byol = "ami-059f3eba3e7c63246"
      },
      x86 = {
        payg = "ami-0f48420bee09cf6a7"
        byol = "ami-0b90d9316ce0daab9"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-00f2fa916cb024dcd"
        byol = "ami-00c00a9179f50cf0b"
      },
      x86 = {
        payg = "ami-0b5730dc28f6ded0c"
        byol = "ami-040739f3f9479feb8"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0acc7c90b713c52c5"
        byol = "ami-03444391e8842e6b2"
      },
      x86 = {
        payg = "ami-0382510c43e5299f5"
        byol = "ami-08c67d0c55223ebf9"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0afa7664edfe8b52c"
        byol = "ami-04feba963372af61e"
      },
      x86 = {
        payg = "ami-08af016469c9be301"
        byol = "ami-085188e1ddbe43125"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0d974801fcb555564"
        byol = "ami-065d91967c9bd6a5d"
      },
      x86 = {
        payg = "ami-097f184146630b559"
        byol = "ami-0f64e989009f155f4"
      }
    }
  }
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

//  Admin HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

variable "bootstrap-fgtvm2" {
  // Change to your own path
  type    = string
  default = "fgtvm2.conf"
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}
