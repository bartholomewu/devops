# main.tf

resource "google_compute_address" "external_ip" {
    name   = "${var.cluster_name}-external-ip"
    region = var.region
}

resource "google_container_node_pool" "gitlab_pool" {
    name                        = var.pool_name
    cluster                     = google_container_cluster.gke_cluster.name
    node_count                  = var.num_nodes

    node_config {
        machine_type            = var.machine_type
        preemptible             = false

        oauth_scopes = [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
            "https://www.googleapis.com/auth/servicecontrol",
            "https://www.googleapis.com/auth/service.management.readonly",
            "https://www.googleapis.com/auth/trace.append"
        ]
    }

    management {
        auto_repair             = true
        auto_upgrade            = true
    }

}

resource "google_container_cluster" "gke_cluster" {
    name                        = var.cluster_name
    location                    = var.region
    initial_node_count          = 1
    remove_default_node_pool    = true

    ip_allocation_policy {}
    network    = var.int_network
    subnetwork = var.subnetwork

    depends_on = [google_compute_address.external_ip]
}

resource "google_compute_project_metadata" "default" {
    metadata = {
        disable-legacy-endpoints = true
        frugal-skip              = true
    }
}