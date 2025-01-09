provider "ibm" {}

resource "ibm_container_cluster" "k8s" {
  name           = var.cluster_name
  location       = var.location
  machine_type   = var.machine_type
  worker_count   = var.worker_count
}

output "cluster_id" {
  value = ibm_container_cluster.k8s.id
} 
