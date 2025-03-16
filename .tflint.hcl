config {
  module = true
  force = false
  disabled_by_default = false
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"

  version = "0.11.0"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}
# Adicione regras específicas conforme necessário
rule "terraform_deprecated_interpolation" {
  enabled = true
}
