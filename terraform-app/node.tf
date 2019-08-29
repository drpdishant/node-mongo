resource "kubernetes_service" "node" {
  metadata {
    name = "terraform-node"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.node.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port        = 3000
      target_port = 3000
    }
  }
}

resource "kubernetes_pod" "node" {
  metadata {
    name = "terraform-node"
    labels = {
      app = "node"
    }
  }

  spec {
    container {
      image = "drpdishant/node-mongo:1.0"
      name  = "node"
      command = ["/usr/local/wait-for-it.sh","--timeout=1200","terraform-mongo:27017","--","npm","start"]
      port {
          container_port = 3000
      }
      env {
          name = "MONGODB_URL" 
          value = "mongodb://terraform-mongo:27017/noobjs_dev"
      }
      
    }
  }
}