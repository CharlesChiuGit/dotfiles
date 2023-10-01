$dict = @{
    gitconfig = @(
        "$Env:USERPROFILE\.gitconfig", 
        "$Env:USERPROFILE\dotfiles\core-utils\git\config"
    )
    pwsh_profile = @(
        "$Env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1", 
        "$Env:USERPROFILE\dotfiles\core-utils\pwsh\Microsoft.PowerShell_profile.ps1"
    )
    pwsh_config = @(
        "$Env:USERPROFILE\Documents\PowerShell\powershell.config.json", 
        "$Env:USERPROFILE\dotfiles\core-utils\pwsh\powershell.config.json"
    )
    windows_terminal = @(
        "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json", 
        "$Env:USERPROFILE\dotfiles\windows_terminal\settings.json"
    )
    lazygit = @(
        "$Env:APPDATA\lazygit\config.yml", 
        "$Env:USERPROFILE\dotfiles\cli-utils\lazygit\config.yml"
    )
    lepton = @(
        "$Env:USERPROFILE\.leptonrc", 
        "$Env:USERPROFILE\dotfiles\gui-utils\lepton\.leptonrc"
    )
    logseq = @(
        "$Env:USERPROFILE\.logseq", 
        "$Env:USERPROFILE\dotfiles\gui-utils\logseq\.logseq"
    )
    starship = @(
        "$Env:USERPROFILE\.config\starship.toml", 
        "$Env:USERPROFILE\dotfiles\cli-utils\starship\starship.toml"
    )
}

# mkdir
@dirs = @(
    "$Env:USERPROFILE\.config",
    "$Env:USERPROFILE\Documents\PowerShell",
    "$Env:APPDATA\lazygit"
)

foreach ($dir in $dirs) {
    if (Test-Path -Path $dir) {
        mkdir $dir
        Write-Host "mkdir for $key"
    }
}


foreach ($key in $dict.Keys) {
    if (Test-Path -Path $dict[$key][0]) {
        rm $dict[$key][0]
    }
    try {
        New-Item -ItemType SymbolicLink -Path $dict[$key][0] -Target $dict[$key][1]
    } catch {
        Write-Host "Failed to create symlink for $key"
    }
}
