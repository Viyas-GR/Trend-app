# ------------------------
# EKS Outputs
# ------------------------

output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.trend_eks.name
}

output "eks_cluster_endpoint" {
  description = "EKS API Endpoint"
  value       = aws_eks_cluster.trend_eks.endpoint
}

output "eks_cluster_version" {
  description = "Kubernetes Version"
  value       = aws_eks_cluster.trend_eks.version
}

output "eks_node_group_name" {
  description = "Managed Node Group"
  value       = aws_eks_node_group.trend_nodes.node_group_name
}
