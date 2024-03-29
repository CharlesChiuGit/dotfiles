$dict = @{
    # pwsh_profile = @(
    #     "$Env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1", 
    #     "$Env:USERPROFILE\dotfiles\core-utils\pwsh\Microsoft.PowerShell_profile.ps1"
    # )
    # pwsh_config = @(
    #     "$Env:USERPROFILE\Documents\PowerShell\powershell.config.json", 
    #     "$Env:USERPROFILE\dotfiles\core-utils\pwsh\powershell.config.json"
    # )
    # windows_terminal = @(
    #     "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json", 
    #     "$Env:USERPROFILE\dotfiles\windows_terminal\settings.json"
    # )
    lazygit = @(
        "$Env:APPDATA\lazygit\config.yml", 
        "$Env:USERPROFILE\dotfiles\cli-utils\lazygit\config.yml"
    )
    lepton = @(
        "$Env:USERPROFILE\.leptonrc", 
        "$Env:USERPROFILE\dotfiles\gui-utils\lepton\.leptonrc"
    )
    starship = @(
        "$Env:USERPROFILE\.config\starship.toml", 
        "$Env:USERPROFILE\dotfiles\cli-utils\starship\starship.toml"
    )
    topgrade = @(
        "$Env:APPDATA\topgrade.toml", 
	"$Env:USERPROFILE\dotfiles\cli-utils\topgrade\topgrade.toml"
    )
}

# mkdir
$dirs = @(
    "$Env:USERPROFILE\.config",
    "$Env:USERPROFILE\Documents\PowerShell",
    "$Env:APPDATA\lazygit"
)

foreach ($dir in $dirs) {
    if (Test-Path -Path $dir) {
        Write-Host "$dir already exists"
    } else {
        mkdir $dir
        Write-Host "mkdir for $dir"
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

$copy_dict = @{
    gitconfig = @(
        "$Env:USERPROFILE\.gitconfig", 
        "$Env:USERPROFILE\dotfiles\core-utils\git\config"
    )
    logseq_pref = @(
        "$Env:USERPROFILE\.logseq\preferences.json", 
        "$Env:USERPROFILE\dotfiles\gui-utils\logseq\preferences.json"
    )
    logseq_settings = @(
    	"$Env:USERPROFILE\.logseq\settings", 
        "$Env:USERPROFILE\dotfiles\gui-utils\logseq\settings"
    )
    logseq_config = @(
    	"$Env:USERPROFILE\.logseq\config", 
        "$Env:USERPROFILE\dotfiles\gui-utils\logseq\config"
    )
}

foreach ($key in $copy_dict.Keys) {
    if (Test-Path -Path $copy_dict[$key][0]) {
        rm $copy_dict[$key][0]
    }
    try {
        cp -r $copy_dict[$key][1] $copy_dict[$key][0]
    } catch {
        Write-Host "Failed to copy file: $key"
    }
}
