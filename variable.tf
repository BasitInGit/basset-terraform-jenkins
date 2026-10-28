variable "region" {
  type        = string
  description = "aws region"
  default     = "eu-west-2"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "m7i-flex.large"
}

variable "ami_id" {
  type        = string
  description = "ami"
  default     = "ami-0c0d6c1f6e60e2599"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
  default     = "vpc-0e00f24a7f3ad70c6"
}

variable "key_name" {
  type        = string
  description = "key"
  default     = "pairing"
}

variable "subnets" {
  type        = list(string)
  description = "subnets"
  default     = ["subnet-0bac2570b997172b7", "subnet-0b815b267e28103f6", "subnet-0d178a51587579494"]
}

variable "zone_id" {
  type        = string
  description = "zone id"
  default     = "Z01752471FYWFTVEJ68WX"
}


variable "domain_name" {
  type        = string
  description = "domain"
  default     = "jenkins.techrite.org"

}
