variable "location" {
  description = "The Azure region for the application infrastructure resources."
  type        = string
}

variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "The environment for the application infrastructure resources."
  type        = string
}

variable "app_service_plan_sku" {
  description = "Linux App Service plan tier"
  type        = string
}

variable "container_image_name" {
  description = "Docker image repo name"
  type        = string
}

variable "container_image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
