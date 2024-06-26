variable "environment" {
  type        = string
  description = "Environment to use. Example: staging, production."
}

variable "domain_name" {
  type        = string
  description = "The root domain name."
}

variable "app_subdomain_name" {
  type        = string
  description = "The domain name for the public facing app. Application load balancer will be attached to this domain. Should be different for staging and production applications."
}

variable "alb_name" {
  type        = string
  description = "Name of the application load balancer."
}

variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 bucket prefix for application load balancer access logs."
}

variable "alb_access_logs_expiry_days" {
  type        = number
  description = "Number of days to retain application load balancer access logs."
}

variable "app_port" {
  type        = number
  description = "The port number app is running on."
}

variable "alb_default_static_response" {
  type = object({
    content_type         = string
    encoded_message_body = string
    status_code          = string
  })
  description = "The default static response to return if no rules match in alb."
}

variable "vpc_id" {
  type        = string
  description = "Identifier for AWS VPC where the resources will be created."
}

variable "http_https_ingress_sg_id" {
  type        = string
  description = "Identifier for the security group allowing access to HTTP(80) and HTTPS(443) ingress. This is used for ingress traffic to load balancer."
}

variable "alb_subnets" {
  type        = list(string)
  description = "List of subnet identifiers to associate subnets to load balancer."
}

variable "alb_aws_account_arn" {
  type        = string
  description = "AWS account ARN for the account containing load balancer."
}

variable "alb_access_logs_bucket_name" {
  type        = string
  description = "S3 bucket name which will be used to store load balancer access logs. Prefix <var.environment> will be added. The bucket name should be unique globally."
}

variable "target_group_healthcheck_enabled" {
  type        = bool
  description = "Enable /Disable target health check."
  default     = true
}

variable "target_group_healthcheck_healthy_threshold" {
  type        = number
  description = "Number of consecutive health checks successes required before considering an unhealthy target healthy."
  default     = 3
}

variable "target_group_healthcheck_unhealthy_threshold" {
  type        = number
  description = "Number of consecutive health check failures required before considering the target unhealthy."
  default     = 3
}

variable "target_group_healthcheck_interval" {
  type        = number
  description = "Approximate amount of time, in seconds, between health checks of an individual target."
  default     = 30
}

variable "target_group_healthcheck_matcher" {
  type        = string
  description = "Response codes to use when checking for a healthy responses from a target."
}

variable "target_group_healthcheck_path" {
  type        = string
  description = "Destination for the health check request."
}

variable "target_group_healthcheck_port" {
  type        = string
  description = "Port to use to connect with the target."
  default     = "traffic-port"
}

variable "target_group_healthcheck_protocol" {
  type        = string
  description = "Protocol to use to connect with the target."
  default     = "HTTP"

}

variable "target_group_healthcheck_timeout" {
  type        = number
  description = "Amount of time, in seconds, during which no response means a failed health check."
  default     = 5
}

variable "target_group_deregistration_delay" {
  type        = number
  description = "Amount of time, in seconds, for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused"
  default     = 300
}

variable "enable_failover_policy" {
  type        = bool
  description = "Should enable/disable Failover policy for the subdomain record"
  default     = false
}

variable "primary_record_healthcheck_id" {
  type        = string
  description = "For Failover Routing policy only. Healthcheck Id of primary record."
  default     = null
}

variable "secondary_record_alias_name" {
  type        = string
  description = "For Failoverrouting policy only. Alias name for secondary record."
  default     = null
}

variable "secondary_record_zone_id" {
  type        = string
  description = "For Failoverrouting policy only. Zone Id for secondary record."
  default     = null
}

variable "secondary_record_healthcheck_id" {
  type        = string
  description = "For Failover Routing policy only. Healthcheck Id of secondary record."
  default     = null
}
