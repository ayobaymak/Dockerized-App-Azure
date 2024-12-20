Dockerized-App-Azure/
├── main.tf
├── outputs.tf
├── variables.tf
├── modules/
│   ├── network/             # Networking resources (VNet, NSG)
│   ├── vm/                  # Virtual Machine setup
│   ├── autoscaling/         # Scaling configuration
│   ├── loadbalancer/        # Load Balancer setup

1. Networking Module (network/main.tf)
Creates a Virtual Network (VNet) and Network Security Groups (NSGs) to allow HTTP/HTTPS traffic.

2. Virtual Machine Module (vm/main.tf)
Creates a VM, installs Docker, and runs the Dockerized application.

3. Load Balancer Module (loadbalancer/main.tf)
Creates a Load Balancer to distribute traffic across multiple instances.

4. Auto-Scaling Module (autoscaling/main.tf)
Creates a VM scale set to ensure scalability and high availability.