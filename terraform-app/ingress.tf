resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "terraform-node"
  }

  spec {
    backend {
      service_name = "terraform-node"
      service_port = 3000
    }
    rule {
      host = "${var.node_fqdn}"
      http {
        path {
          path = "/"          
          backend {
            service_name = "terraform-node"
            service_port = 3000
          }
          
        }
      }
    }
  }
}