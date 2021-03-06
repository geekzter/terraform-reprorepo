# resource null_resource nested_pwsh_1a {
#   provisioner "local-exec" {
#     command                    = "Get-Command 'Get-AzResource'"
#     interpreter                = ["pwsh", "-nop", "-Command"]
#   }

#   provisioner "local-exec" {
#     command                    = "Get-Command 'New-AzPrivateDnsRecordConfig'"
#     interpreter                = ["pwsh", "-nop", "-Command"]
#   }
# }

# resource null_resource nested_pwsh_1b {
#   provisioner "local-exec" {
#     command                    = "Get-Command 'Get-AzResource'"
#     interpreter                = ["pwsh", "-nop", "-Command"]
#   }

#   provisioner "local-exec" {
#     command                    = "Get-Command 'New-AzPrivateDnsRecordConfig'"
#     interpreter                = ["pwsh", "-nop", "-Command"]
#   }
# }

resource null_resource nested_pwsh_2 {
  # Doesn't work
  provisioner local-exec {
    command                    = "script.ps1"
    interpreter                = ["pwsh", "-nop", "-File"]
  }

  # Doesn't work
  provisioner local-exec {
    command                    = ". ./script.ps1"
    interpreter                = ["pwsh", 
                                  "-NoLogo", 
                                  "-NoProfile", 
                                  "-NonInteractive", 
                                  "-ExecutionPolicy","Unrestricted", 
                                  "-Command"]
  }

  # Works
  provisioner local-exec {
    command                    = "Get-Command Get-AzResource"
    interpreter                = ["pwsh", "-nop", "-Command"]
  }
  provisioner local-exec {
    command                    = "Get-Command New-AzPrivateDnsRecordConfig"
    interpreter                = ["pwsh", "-nop", "-Command"]
  }
}