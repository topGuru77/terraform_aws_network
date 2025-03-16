output "vpc_id" { 
    value = aws_vpc.terraformvpc.id 
}

output "vpc_arn" {
    value = aws_vpc.terraformvpc.arn
}

output "hdcp_options" {
    value = aws_vpc.terraformvpc.default_network_acl_id
} 
