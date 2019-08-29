variable "mongodb_host" {
    type = "string"
    default = "terraform-mongo"
}
variable "mongodb_port" {
  description = "mongodb port"
  default = "27017" 
}

variable "mongo_image" {
  description = "mongo db image name"
  default = "mongo"
}

variable "node_fqdn" {
  description = "Node Front END FQDN"
  default = "node.example.com"
}
