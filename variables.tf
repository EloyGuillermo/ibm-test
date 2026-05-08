variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "ssh_key_name" {
  type = string
}


variable "instance_name" {
  type = string
}

variable "profile" {
  type = string
}

variable "image" {
  type = string
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}

variable "resource_group" {
  type = string
}