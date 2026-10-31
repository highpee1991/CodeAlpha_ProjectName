variable "location" {
  description = "The Azure region for the application infrastructure resources."
  type        = string
  default     = "East US"

}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "codealpha"
}

variable "environment" {
  description = "The environment for the application infrastructure resources."
  type        = string
  default     = "dev"
}

variable "app_service_plan_sku" {
  description = "Linux App Service plan tier"
  type        = string
  default     = "B1"
}

variable "container_image_name" {
  description = "Docker image repo name"
  type        = string
  default     = "devops-status-dashboard"
}

variable "container_image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}