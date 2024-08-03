data "aws_ami" "latest_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Replace with your desired AMI name pattern
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]  # Replace with the owner ID if you want to restrict to a specific owner
}


output "latest_ami_id" {
  value = data.aws_ami.latest_ami.id
  description = "The ID of the latest AMI"
}
