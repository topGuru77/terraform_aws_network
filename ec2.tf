resource "aws_instance" "web" {
  for_each = {
    vm1 = "t2.micro"
    vm2 = "t2.large"
  }  
  ami           = var.ami
  instance_type = each.value
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "Sandbox ${each.key}"
  }
}
