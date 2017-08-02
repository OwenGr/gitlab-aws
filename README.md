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
1. Clone the repository by typing ```git clone http://thisrepository.git``` in your shell
1. Copy `terraform.tfvars.sample` to ```terraform.tfvars```
1. Modify `terraform.tfvars` to reflect the settings appropriate for your environment
1. Execute `terraform plan` to verify your variable selection works
1. Execute `terraform apply` to apply your changes
