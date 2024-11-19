# namespaces.tf

resource "kubernetes_namespace" "ingress_nginx" {
    metadata {
        name = "ingress-nginx"
    }
}

resource "kubernetes_namespace" "gitlab" {
    metadata {
        name = "gitlab"
    }
}
