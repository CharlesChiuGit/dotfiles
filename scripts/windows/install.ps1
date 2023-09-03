#Requires -Version 7.1

# We don't need return codes for "$(command)", only stdout is needed.
# Allow `func "$(command)"`, pipes, etc.

Set-StrictMode -Version 3.0

$ErrorActionPreference = "Stop" # Exit when command fails

# package mgr vars
$winget_id = @(
    	"CrystalDewWorld.CrystalDiskInfo",
	"CrystalDewWorld.CrystalDiskMark",
	"JGraph.Draw",
	"FastStone.Viewer",
	"Foxit.FoxitReader",
	"Harmonoid.Harmonoid",
	"CosmoX.Lepton",
	"Logitech.OptionsPlus",
	"Logitech.LogiBolt",
	"Obsidian.Obsidian",
	"PopcornTime.Popcorn-Time",
	"Daum.PotPlayer",
	"Telegram.TelegramDesktop",
	"Microsoft.VisualStudioCode",
	"Bandisoft.Honeyview",
	"DIscord.Discord",
	"Git.Git",
	"Google.Chrome",
	"Logseq.Logseq",
	"Microsoft.PowerShell",
	"Microsoft.PowerToys",
	"Nvidia.GeForceExperience",
	"RARLab.WinRAR",
	"RustemMussabekov.Raindrop",
	"Valve.Steam",
	"CiderCollective.Cider",
	"th-ch.YouTubeMusic",
	"File-New-Project.EarTrumpet",
	"Element.Element",
	"Mozilla.Firefox",
	"Microsoft.WindowsSDK.10.0.22621",
	"GeekUninstaller.GeekUninstaller",
	"Rustlang.Rustup"
)
# $scoop_package_matrix = @{ "" }

# env vars
# $env:XDG_CONFIG_HOME ??= $env:LOCALAPPDATA
echo $winget_id
