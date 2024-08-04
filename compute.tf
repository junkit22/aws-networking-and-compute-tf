module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.sg_name
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    "http-80-tcp",
    "ssh-tcp",
    "https-443-tcp"
  ]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
    }
  ]
}

# Output the security group ID
output "this_security_group_id" {
  value = module.web_server_sg.security_group_id
}


module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name   = var.ec2_name

  ami                    = data.aws_ami.latest_ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  #vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    subnet_id     = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = var.ec2_name
  }
}

/*
# Creates a security group that allows us to create 
# ingress rules allowing traffic for HTTP, HTTPS and SSH protocols from anywhere
# You may add additional ingress rules if you would like to expose your EC2
# from other ports and protocols
resource "aws_security_group" "ec2_sg" {
  name   = var.sg_name
  vpc_id = module.vpc.vpc_id # var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
*/

/*
# This code block allows us to create an ec2 instance with the use of variables
# To overwrite any one particular variable, we can pass the variable at runtime during terraform apply step
# e.g. terraform apply --var ec2_name="my-var-webserver"
resource "aws_instance" "sample_ec2_variables" {
  #ami          = var.ami_id
  ami           = data.aws_ami.latest_ami.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(module.vpc.public_subnets, 0)
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.ec2_name
  }
}
*/