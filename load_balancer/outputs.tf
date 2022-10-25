output "lb_ip_address" {
  value = yandex_lb_network_load_balancer.lb-test.listener.*.external_address_spec
}

output "external_ip_address_vm_1" {
  value = data.terraform_remote_state.vpc.outputs.external_ip_address_vm_1
}

output "external_ip_address_vm_2" {
  value = data.terraform_remote_state.vpc.outputs.external_ip_address_vm_2
}

