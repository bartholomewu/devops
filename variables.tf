# variables.tf

variable "region" {
    description = "GCP region for the cluster"
    default     = "us-central1"
}

variable "zone_extension" {
    description = "Zone extension"
    default     = "b"
}

variable "cluster_name" {
    description = "Name of the GKE cluster"
    default     = "gitlab-cluster"
}

variable "pool_name" {
    description = "Name of the GKE cluster pool"
    default     = "gitlab-pool"
}

variable "machine_type" {
    description = "Type of machine for the GKE nodes"
    default     = "n2-standard-2"
}

variable "num_nodes" {
    description = "Number of initial nodes"
    default     = 1
}

variable "autoscale_min_nodes" {
    description = "Minimum number of nodes for autoscaling"
    default     = 0
}

variable "autoscale_max_nodes" {
    description = "Maximum number of nodes for autoscaling"
    default     = 2
}

variable "int_network" {
    description = "Network name"
    default     = "default"
}

variable "subnetwork" {
    description = "Subnetwork name"
    default     = "default"
}

variable "use_static_ip" {
    description = "Whether to use a static IP for the cluster"
    default     = true
}

variable "rbac_enabled" {
    description = "Whether to enable RBAC for the cluster"
    default     = false
}
