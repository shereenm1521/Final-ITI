
module "vpc" {
  source                 = "./vpc"
  vpc_project            = "sherein"
  vpc_name               = "vpc-network"
  vpc_auto_create_subnet = false
  vpc_mtu                = 1460
}


#----------------MODULES ----------------

module "firewalls" {
  source                 = "./firewall"
  firewall_name          = "allow-ssh"
  firewall_network       = module.vpc.vpc_name
  firewall_priority      = 1000
  firewall_direction     = "INGRESS"
  firewall_project       = module.vpc.vpc_project
  firewall_source_ranges = ["35.235.240.0/20"]
  firewall_protocol      = "tcp"
  firewall_ports         = ["22","443","80"]
  firewall_tags          = ["public"]
}

module "management_subnet" {
  source         = "./subnet"
  subnet_name    = "management-subnet"
  subnet_cider   = "10.0.1.0/24"
  subnet_region  = "us-east1"
  subnet_network = module.vpc.vpc_id
  depends_on = [
    module.vpc
  ]
}


#--------------------------- 


module "kubernetes_cluster" {
  source                    = "./GKE"
  k8s_service_project       = module.vpc.vpc_project
  k8s_cluster_name          = "my-gke-cluster"
  k8s_cluster_location      = "us-east1-b"
  k8s_cluster_network       = module.vpc.vpc_name
  k8s_cluster_subnetwork    = module.management_subnet.subnet_name
  k8s_cluster_count         = 1
  k8s_cluster_master_cider  = "172.16.0.0/28"
  k8s_cluster_node_name     = "my-node-pool"
  cluster_tags              =["public"]
  depends_on = [
    module.management_subnet
  ]
}
