# aws-networking-and-compute-tf

# Learning Objectives:
This assignment aims to create an EC2 instance, a VPC, and all necessary networking resources using Terraform. Additionally, the assignment explores retrieving the ami_id using a data block instead of hardcoding it in variables.tf. Another key objective is to familiarize with using Terraform modules to streamline infrastructure as code.

# Tasks:
1. Create a VPC and Networking Resources:
    - Use Terraform modules to create a VPC.
    - Include all necessary resources such as subnets, an internet gateway (IGW), route tables, and route table associations.
    - Ensure that the configuration supports public and private subnet scenarios.

2. Create an EC2 Instance and Security Group:
    - Deploy an EC2 instance within the public subnet of the VPC created in the previous task.
    - Use a Terraform module for the EC2 instance to simplify the configuration process.
    - Configure a security group that allows necessary traffic (e.g., SSH and HTTP/HTTPS).

3. Retrieve ami_id Dynamically:
    - Use a data block to dynamically retrieve the latest Amazon Machine Image (AMI) ID instead of hardcoding it.
    - Ensure the data block is correctly configured to fetch the appropriate AMI based on specified filters and criteria.

4. Connect to EC2 via SSH:
    - After deploying the EC2 instance, establish a connection to it using SSH.
    - Ensure the security group allows inbound SSH traffic from your IP range.
    - Verify the connection and confirm the instance is reachable and properly configured.

# Summary:
By completing this assignment, learners will gain practical experience in using Terraform to provision and manage cloud infrastructure. Learners will learn how to dynamically fetch resources, utilize modules to organize and simplify Terraform code, and establish secure connections to learners' instances.

# References:
- Networking, VPC and more with Terraform Resources: https://github.com/luqmannnn/aws-networking-and-compute-tf
- Modules: https://github.com/luqmannnn/simple-tf-module
- EC2 instance module https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest
- Security group module: https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
- VPC module: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest