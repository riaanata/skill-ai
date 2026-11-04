param(
    [Parameter(Mandatory = $true)]
    [string]$Destination,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$PackageRoot = Split-Path -Parent $ScriptRoot
$Source = Join-Path $PackageRoot "project-template"

if (-not (Test-Path $Source)) {
    throw "Project template folder not found: $Source"
}

if (-not (Test-Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    Write-Host "Created destination folder: $Destination" -ForegroundColor Green
}

Write-Host "Applying APES Unified Project Template to: $Destination" -ForegroundColor Cyan
Write-Host "Included: .agent (rules & skills), .github (copilot instructions & skills), docs, prompts, templates, AGENTS.md"

Copy-Item (Join-Path $Source "*") $Destination -Recurse -Force

Write-Host "`nSuccessfully copied unified project template!" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Open your project in Antigravity or VS Code."
Write-Host "2. Customize PROJECT.md and docs/TECH_STACK.md for your stack."
Write-Host "3. Start coding using commands like /implement-feature, /debug-fix, /code-review."
