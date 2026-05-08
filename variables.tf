variable "region" {
  description = "Región IBM Cloud"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "subnet_name" {
  description = "Nombre de la subred"
  type        = string
}

variable "zone" {
  description = "Zona de disponibilidad"
  type        = string
}

variable "subnet_ipv4_count" {
  description = "Cantidad de IPs IPv4"
  type        = number
  default     = 256
}

variable "resource_group" {
  description = "Nombre del resource group"
  type        = string
}