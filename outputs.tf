output "vpc_id" {
  value = ibm_is_vpc.vpc.id
}

output "vpc_name" {
  value = ibm_is_vpc.vpc.name
}

output "subnet_id" {
  value = ibm_is_subnet.subnet.id
}

output "subnet_name" {
  value = ibm_is_subnet.subnet.name
}