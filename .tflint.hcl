config {
  module = true
  force = false
  disabled_by_default = false
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
  version = "1.9.2"
}

# Adicione regras específicas conforme necessário
rule "terraform_deprecated_interpolation" {
  enabled = true
}

# Configuração para o diretório de exemplo
rule "terraform_module_pinned_source" {
  enabled = true
  include = ["example/**/*.tf"]
}