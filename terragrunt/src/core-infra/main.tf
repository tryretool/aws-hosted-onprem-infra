// module "eks" {
//   source  = "terraform-aws-modules/eks/aws"
//   version = "18.20.2"

//   cluster_name    = var.cluster_name
//   cluster_version = var.cluster_version

//   cluster_endpoint_private_access = true
//   cluster_endpoint_public_access  = true

//   cluster_addson = {
//     coredns = {
//       resolve_conflicts = "OVERWRITE"
//     }
//     vpc-cni = {
//       resolve_conflicts = "OVERWRITE"
//     }
//   }
// }

