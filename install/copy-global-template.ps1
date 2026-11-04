param(
    [Parameter(Mandatory = $true)]
    [string]$Destination
)

$ErrorActionPreference = "Stop"
$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$PackageRoot = Split-Path -Parent $ScriptRoot
$Source = Join-Path $PackageRoot "global"

if (-not (Test-Path $Source)) {
    throw "Global template folder not found: $Source"
}

if (-not (Test-Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
}

Write-Host "Copying APES global templates to: $Destination"
Write-Host "This does not modify Antigravity settings automatically."

Copy-Item (Join-Path $Source "*") $Destination -Recurse -Force
Write-Host "Done. Review the files and manually connect them using your Antigravity version's Settings / Customizations UI."
