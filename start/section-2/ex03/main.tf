terraform {
required_version = ">= 0.15"
required_providers {
local = {
source  = "hashicorp/local"
version = "~> 2.0"
}
}
}

resource "local_file" "Britney" {
filename = "I_did_it_again.txt"
content  = <<-EOT
'Cause to lose all my senses

That is just so typically me 
You see, my problem is this, I'm dreaming away
Can't you see I'm a fool in so many ways?
EOT
}
