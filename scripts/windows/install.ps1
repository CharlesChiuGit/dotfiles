#Requires -Version 7.1

# We don't need return codes for "$(command)", only stdout is needed.
# Allow `func "$(command)"`, pipes, etc.

Set-StrictMode -Version 3.0

$ErrorActionPreference = "Stop" # Exit when command fails

# package mgr vars
$winget_id = @(
    "Bandisoft.Honeyview",
    "CiderCollective.Cider",
    "CosmoX.Lepton",
    "CrystalDewWorld.CrystalDiskInfo",
    "CrystalDewWorld.CrystalDiskMark",
    "Daum.PotPlayer",
    "Discord.Discord",
    "Element.Element",
    "FastStone.Viewer",
    "File-New-Project.EarTrumpet",
    "Foxit.FoxitReader",
    "GeekUninstaller.GeekUninstaller",
    "Git.Git",
    "Google.Chrome",
    "Harmonoid.Harmonoid",
    "JGraph.Draw",
    "Logitech.LogiBolt",
    "Logitech.OptionsPlus",
    "Logseq.Logseq",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsSDK.10.0.22621",
    "Mozilla.Firefox",
    "Nvidia.GeForceExperience",
    "Obsidian.Obsidian",
    "PopcornTime.Popcorn-Time",
    "RARLab.WinRAR",
    "RustemMussabekov.Raindrop",
    "Rustlang.Rustup",
    "Telegram.TelegramDesktop",
    "Valve.Steam",
    "th-ch.YouTubeMusic"
)
$scoop_id = @(
    "7zip",
    "JetBrainsMono-NF",
    "JetBrainsMono-NF-Mono",
    "dark",
    "delta",
    "lazygit",
    "neovim",
    "nodejs",
    "python",
    "starship",
    "zoxide"
)

# env vars
# $env:XDG_CONFIG_HOME ??= $env:LOCALAPPDATA

For ($i = 0; $i -le ($winget_id-1); $i++) (
    winget install -e --id $winget_id[i] --ignore-security-hash
)

For ($i = 0; $i -le ($scoop_id-1); $i++) (
    scoop install $scoop_id[i] 
)

