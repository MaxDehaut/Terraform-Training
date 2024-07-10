output "svr_ip" {
  sensitive = true
  value     = module.application.vmdetails
}