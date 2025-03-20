module "apps" {
  source = "./modules/"
  appname = "my-app-service"  

}

output "url" {
  value = module.apps.app_url

}
