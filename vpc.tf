module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "junjie-tf-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}



/*

## Creates a VPC resource
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "junjie-tf-vpc"
  }
}

## Creates the first public subnet in AZ1
resource "aws_subnet" "my_public_subnet_az1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "junjie-tf-public-subnet-az1"
  }
}


## Creates the first private subnet in AZ1
resource "aws_subnet" "my_private_subnet_az1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "junjie-tf-private-subnet-az1"
  }
}

## Creates the second public subnet in AZ2
resource "aws_subnet" "my_public_subnet_az2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "junjie-tf-public-subnet-az2"
  }
}

## Creates the second private subnet in AZ2
resource "aws_subnet" "my_private_subnet_az2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "junjie-tf-private-subnet-az2"
  }
}

## Creates an IGW for your VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "junjie-tf-igw"
  }
}

## Create vpc endpoint for S3
resource "aws_vpc_endpoint" "vpces3" {
  vpc_id       = aws_vpc.my_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"

  tags = {
    Name = "junjie-tf-vpce-s3"
  }

  route_table_ids = [aws_route_table.my_private_route_table_az1.id, aws_route_table.my_private_route_table_az2.id]
}
*/
