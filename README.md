# Example code for a terragrunt show issue

After the plan file for a multiple groups terragrunt project has been generated, the terragrunt show fails because of it's trying to get the providers for the 2nd group of the resources for generation the show for the 1st group.

# Steps to reproduce

1) go to terragrunt-show/accounts/test/eu-central-1/my-stack-resource-for-terragrunt-show
2) run terragrunt run-all plan -out ~/git/terragrunt-show/accounts/test/eu-central-1/my-stack-resource-for-terragrunt-show/m.tfplan --terragrunt-non-interactive
3) terragrunt run-all show terragrunt-show/accounts/test/eu-central-1/my-stack-resource-for-terragrunt-show/m.tfplan --terragrunt-non-interactive