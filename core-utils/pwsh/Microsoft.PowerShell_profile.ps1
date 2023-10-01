# Starship prompt
Invoke-Expression (&starship init powershell)

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# Alias
Set-Alias -Name lg -Value "$env:UserProfile\scoop\shims\lazygit.exe"
del alias:nv -Force
Set-Alias -Name nv -Value "$env:UserProfile\scoop\shims\nvim.exe"
