data "ibm_resource_group" "group" {
  name = var.resource_group
}

resource "ibm_is_vpc" "vpc" {
  name           = var.vpc_name
  resource_group = data.ibm_resource_group.group.id
}

resource "ibm_is_subnet" "subnet" {
  name                     = var.subnet_name
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = var.zone
  total_ipv4_address_count = var.subnet_ipv4_count
  resource_group           = data.ibm_resource_group.group.id
}