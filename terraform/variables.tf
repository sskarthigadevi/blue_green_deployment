 variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  default     = "blue-green-cluster"
}

variable "location" {
  description = "Location of the cluster"
  default     = "us-south"
}

variable "machine_type" {
  description = "Machine type for worker nodes"
  default     = "b3c.4x16"
}

variable "worker_count" {
  description = "Number of worker nodes"
  default     = 3
}

