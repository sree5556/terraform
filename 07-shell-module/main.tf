module "files" {
  source  = "matti/resource/shell"
  command = "date +%s"
}

output "my_files" {
  value = module.files.stdout
}