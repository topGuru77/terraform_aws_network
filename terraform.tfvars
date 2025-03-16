vpc_cidr_block = "10.0.0.0/16"
vpc_instance_tenancy = "default" 
tag_overlay = {
  Name = "vpcdemo"
  Env = "Dev"
  ProjectID = "1234"
  PM = "John Doe" 
}

pubsubnet_cidr_block = "10.0.0.0/24"
privsubnet_cidr_block = "10.0.1.0/24"
pubrt_cidrblock = "0.0.0.0/0"
privrt_cidrblock = "0.0.0.0/0"
ami = "ami-04aa00acb1165b32a"
# instance_type = "t2.micro" 
ec2_name = ["test", "sandbox"] 