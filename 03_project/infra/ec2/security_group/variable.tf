variable "ssh_port" {
  description = "The port will use for SSH requests"
  type        = number
  default     = 22
}
variable "app_port" {
  description = "The port will use for HTTP requests"
  type        = number
  default     = 8080
}
variable "http_port" {
  description = "The port will use for HTTP requests"
  type        = number
  default     = 80
}
variable "https_port" {
  description = "The port will use for HTTP requests"
  type        = number
  default     = 443
}