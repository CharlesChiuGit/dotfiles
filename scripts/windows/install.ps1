#Requires -Version 7.1

# We don't need return codes for "$(command)", only stdout is needed.
# Allow `func "$(command)"`, pipes, etc.

Set-StrictMode -Version 3.0

$ErrorActionPreference = "Stop" # Exit when command fails

# Check if running as admin
if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`" `"$($MyInvocation.MyCommand.UnboundArguments)`""
    Exit
}

# package mgr vars
$winget_ids = @(
    "Audient.EVO", # EVO 4 Control
    "CPUID.CPU-Z.ROG",
    "CiderCollective.Cider",
    "CosmoX.Lepton",
    "CrystalDewWorld.CrystalDiskInfo",
    "CrystalDewWorld.CrystalDiskMark",
    "Daum.PotPlayer",
    "Discord.Discord",
    "Element.Element",
    "File-New-Project.EarTrumpet",
    "FinalWire.AIDA64.Extreme",
    "Foxit.FoxitReader",
    "GeekUninstaller.GeekUninstaller",
    "Git.Git",
    "Google.Chrome",
    "Harmonoid.Harmonoid",
    # "JGraph.Draw",
    "Logitech.LogiBolt",
    "Logitech.OptionsPlus",
    "Logseq.Logseq",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Microsoft.VCRedist.2015+.x64"
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsSDK.10.0.22621",
    "Mozilla.Firefox",
    "NovaTechnology.Beeper",
    "Nvidia.GeForceExperience",
    "Obsidian.Obsidian",
    "PopcornTime.Popcorn-Time",
    "RARLab.WinRAR",
    "REALiX.HWiNFO",
    "RustemMussabekov.Raindrop",
    "Rustlang.Rustup",
    "Seagate.SeaTools", # SeaTools for Windows
    "Telegram.TelegramDesktop",
    "Valve.Steam",
    "th-ch.YouTubeMusic"
    # "Bandisoft.Honeyview",
    # "FastStone.Viewer",
)
$scoop_ids= @(
    "7zip",
    "JetBrainsMono-NF",
    "JetBrainsMono-NF-Mono",
    "dark",
    "delta",
    "fzf",
    "lazygit",
    "neovim",
    "nodejs",
    "python",
    "starship",
    "topgrade",
    "zoxide"
)

# env vars
# $env:XDG_CONFIG_HOME ??= $env:LOCALAPPDATA

winget settings --enable InstallerOverride

foreach ($winget_id in $winget_ids) {
    winget install -e -h --id $winget_id --ignore-security-hash --disable-interactivity --accept-source-agreements --accept-package-agreements
}

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
}

# add scoop buckets
scoop bucket add extras
scoop bucket add nerd-fonts

foreach ($scoop_id in $scoop_ids) {
    scoop install $scoop_id
}
