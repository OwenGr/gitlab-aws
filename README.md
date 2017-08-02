# gitlab-tf
A set of Terraform scripts for maintaining HA GitLab CE on AWS

## Getting Started
You will need a few things installed to get started
### Prerequisites
- Terraform v9.0+
- AWS CLI configured with a key/secret associated to the account you want to deploy to
- Visual Studio Code w/Terraform extension, or a similar text editing tool
- A safe place to store your tfstate

### To deploy GitLab to AWS
1. Clone the repository by typing `git clone http://thisrepository.git` in your shell
1. Copy `terraform.tfvars.sample` to `terraform.tfvars`
1. Modify `terraform.tfvars` to reflect the settings appropriate for your environment
1. Execute `terraform plan` to verify your variable selection works
1. Execute `terraform apply` to apply your changes

### Destroying the infrastructure
A simple `terraform destroy` should destroy your infrastructure. Please note, however, that a database snapshot is created automatically when destroying the RDS instance. If this is a throw-away instance of GitLab, be sure to manually destroy the snapshot to save on disk space.