resource "kubernetes_service" "mongo" {
  metadata {
    name = "terraform-mongo"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.mongo.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port        = 27017
      target_port = 27017
    }
  }
}

resource "kubernetes_pod" "mongo" {
  metadata {
    name = "terraform-mongo"
    labels = {
      app = "MyApp"
    }
  }

  spec {
    container {
      image = "mongo"
      name  = "mongo"
    }
  }
}