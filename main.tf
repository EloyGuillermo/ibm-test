data "ibm_resource_group" "group" {
  name = var.resource_group
}
resource "ibm_is_vpc" "vpc" {
  name           = var.vpc_name
  resource_group = data.ibm_resource_group.group.id
}

resource "ibm_is_security_group" "sg" {
  name = "${var.vpc_name}-sg"
  vpc  = ibm_is_vpc.vpc.id
  resource_group = data.ibm_resource_group.group.id
}

resource "ibm_is_security_group_rule" "allow_ssh_inbound" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_subnet" "subnet" {
  name                     = var.subnet_name
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = var.zone
  total_ipv4_address_count = 256
  resource_group           = data.ibm_resource_group.group.id
}
resource "ibm_is_ssh_key" "sshkey" {
  name           = var.ssh_key_name
  public_key     = var.ssh_public_key
  resource_group = data.ibm_resource_group.group.id
}

resource "ibm_is_instance" "vsi" {
  name    = var.instance_name
  vpc     = ibm_is_vpc.vpc.id
  zone    = var.zone
  profile = var.profile
  image   = var.image
  keys    = [ibm_is_ssh_key.sshkey.id]
  resource_group = data.ibm_resource_group.group.id

  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }
}

resource "ibm_is_floating_ip" "fip" {
  name           = "${var.instance_name}-fip"
  target         = ibm_is_instance.vsi.primary_network_interface[0].id
  resource_group = data.ibm_resource_group.group.id
}