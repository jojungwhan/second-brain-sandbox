# Checks that this computer can run the vault. Changes nothing except:
# if the vault folder is not under Git yet, it runs "git init" and makes the first commit.
# Usage:  powershell -ExecutionPolicy Bypass -File check.ps1 ko     (or: en)
param([string]$vault = "")
$ErrorActionPreference = "Continue"
if ($vault -ne "ko" -and $vault -ne "en") { Write-Output "Usage: powershell -ExecutionPolicy Bypass -File check.ps1 ko   (or: en)"; exit 2 }
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$dir = Join-Path $here $vault
if (-not (Test-Path $dir)) { Write-Output "FAIL  folder $vault not found"; exit 1 }
Set-Location $dir
$script:fail = 0
function Ok($m)   { Write-Output "OK    $m" }
function Bad($m)  { Write-Output "FAIL  $m"; $script:fail = 1 }
function Note($m) { Write-Output "NOTE  $m" }
function Has($c)  { return [bool](Get-Command $c -ErrorAction SilentlyContinue) }

foreach ($f in "AGENTS.md","CLAUDE.md","skills\ingest.md","checks\tool-change-check.md","tools\authorship.py") {
  if (-not (Test-Path $f)) { Bad "missing file: $vault\$f (download the repository again)" }
}
if ($script:fail -eq 0) { Ok "vault files are in place" }

if (Has git) {
  Ok ("git: " + (git --version))
  git rev-parse --is-inside-work-tree 2>$null | Out-Null
  if ($LASTEXITCODE -eq 0) {
    Ok "this folder is under Git"
    if (git remote 2>$null) { Note "this copy has a Git remote. Do not push your own notes. Safer: download the ZIP instead of cloning." }
  } else {
    git init -q 2>$null | Out-Null
    git add -A 2>$null | Out-Null
    git -c user.name="vault" -c user.email="vault@localhost" commit -q -m "Start vault" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) { Ok "started Git history in $vault\ (first commit made)" } else { Bad "could not start Git history" }
  }
} else { Bad "git not found. Install it: https://git-scm.com/downloads" }

$py = ""
foreach ($c in "python","py","python3") {
  if (Has $c) {
    & $c -c "import sys; sys.exit(0 if sys.version_info >= (3, 8) else 1)" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) { $py = $c; break }
  }
}
if ($py) {
  & $py tools\authorship.py 2>$null | Out-Null
  if ($LASTEXITCODE -eq 0) { Ok "authorship tool runs ($py tools\authorship.py)" } else { Bad "authorship tool failed: $py tools\authorship.py" }
} else { Note "Python 3 not found. Only the authorship count needs it. The agent works without it. https://www.python.org/downloads/" }

$agents = 0
if (Has claude) { Ok ("Claude Code: " + (claude --version 2>$null | Select-Object -First 1)); $agents = 1 }
if (Has codex)  { Ok ("Codex CLI: "  + (codex --version 2>$null | Select-Object -First 1)); $agents = 1 }
if ($agents -eq 0) {
  Bad "no coding agent found. Install one of them:"
  Write-Output "        Claude Code  https://code.claude.com/docs/en/setup"
  Write-Output "        Codex CLI    https://developers.openai.com/codex/cli"
}

Write-Output ""
if ($script:fail -eq 0) {
  Write-Output "Ready. Next:"
  Write-Output "  cd $vault"
  Write-Output "  claude        (or: codex)"
  Write-Output "  then sign in with your subscription and try the first request in checks\tool-change-check.md"
} else { Write-Output "Fix the FAIL lines above, then run this check again." }
exit $script:fail
