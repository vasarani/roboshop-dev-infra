# output "sg_id" {
#   value = module.sg.sg_id
# }

output "sg_ids_names" {
  value = module.sg[*].sg_id
}