output "elb_dns" {
  description = "DNS name of the Load Balancer"
  value       = aws_lb.test_elb.dns_name
}

