# providers.tf

provider "google" {
    project = "devopsgroupproj"
    region  = "us-central1"
}

provider "google-beta" {
    project = "devopsgroupproj"
    region  = "us-central1"
}

provider "kubernetes" {
    host                   = "https://${google_container_cluster.gke_cluster.endpoint}"
    cluster_ca_certificate = base64decode(google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
    config_path            = "~/.kube/config"  # Path to your kubeconfig file
}

provider "helm" {
    kubernetes {
        host                   = "https://${google_container_cluster.gke_cluster.endpoint}"
        cluster_ca_certificate = base64decode(google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate)
        token                  = data.google_client_config.default.access_token
        config_path            = "~/.kube/config"  # Path to your kubeconfig file
        exec {
            api_version = "client.authentication.k8s.io/v1beta1"
            command     = "gke-gcloud-auth-plugin"
        }
    }
}
