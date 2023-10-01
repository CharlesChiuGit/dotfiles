$dict = @{
    gitconfig = @(
        "%USERPROFILE%\.gitconfig", 
        "%USERPROFILE%\dotfiles\core-utils\git\.gitconfig"
    )
    pwsh_profile = @(
        "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1", 
        "%USERPROFILE%\dotfiles\core-utils\pwsh\Microsoft.PowerShell_profile.ps1"
    )
    pwsh_config = @(
        "%USERPROFILE%\Documents\PowerShell\powershell.config.json", 
        "%USERPROFILE%\dotfiles\core-utils\pwsh\powershell.config.json"
    )
    windows_terminal = @(
        "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json", 
        "%USERPROFILE%\dotfiles\windows_terminal\settings.json"
    )
    lazygit = @(
        "%APPDATA%\lazygit\config.yml", 
        "%USERPROFILE%\dotfiles\cli-utils\lazygit\config.yml"
    )
    lepton = @(
        "%USERPROFILE%\.leptonrc", 
        "%USERPROFILE%\dotfiles\gui-utils\lepton\.leptonrc"
    )
    logseq = @(
        "%USERPROFILE%\.logseq", 
        "%USERPROFILE%\dotfiles\gui-utils\logseq\.logseq"
    )
    starship = @(
        "%USERPROFILE%\.config\starship.toml", 
        "%USERPROFILE%\dotfiles\cli-utils\starship\starship.toml"
    )
}

mkdir %APPDATA%\lazygit
foreach ($key in $dict.Keys) {
    New-Item -ItemType SymbolicLink -Path $dict[$key][0] -Target $dict[$key][1]
}
