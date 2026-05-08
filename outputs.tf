output "floating_ip" {
  value = ibm_is_floating_ip.fip.address
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/id_rsa root@${ibm_is_floating_ip.fip.address}"
}