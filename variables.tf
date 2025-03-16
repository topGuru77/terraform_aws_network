variable "vpc_cidr_block" {
  description = "This cidr block for the vpc"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = "This is the instance tenancy for the vpc"
  type        = string
}

variable "tag_overlay" {
  description = "These are the tags for the resources"
  type        = map(string) 
}

variable "pubsubnet_cidr_block" {
  type        = string
}

variable "privsubnet_cidr_block" {
  type        = string
}

variable "pubrt_cidrblock" {
  type        = string
}

variable "privrt_cidrblock" {
  type        = string
} 
 
variable "ami" {
  type        = string
}

# variable "instance_type" {


variable "ec2_name" {
  type        = list(string)
}
