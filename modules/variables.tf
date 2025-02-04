variable "elb_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the ELB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnets for the ELB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the ELB is deployed"
  type        = string
}

variable "instance_ids" {
  description = "List of EC2 instances to attach to the target group"
  type        = list(string)
}

