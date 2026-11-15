# Downloads content packages from this repository's Releases into the folders the other scripts use
# (consolidated/packages/, packages/<batch>/, packages-earlier-run-assets/, ...), as listed in packages.tsv.
# Every file is checked against its SHA-256; files already there with the right checksum are skipped, so
# the command can run again after an interruption.
#
#   powershell -ExecutionPolicy Bypass -File download-packages.ps1 -Batch B001      # one batch (all its folders)
#   powershell -ExecutionPolicy Bypass -File download-packages.ps1 -Release <tag>   # one release (PACKAGES.md)
#   powershell -ExecutionPolicy Bypass -File download-packages.ps1 -All             # every current package (about 23 GB)
#   powershell -ExecutionPolicy Bypass -File download-packages.ps1 -Archive         # the archived packages, below archive\ (about 28 GB: they repeat most current ones)
#   add -DryRun to list what would be downloaded
param([string]$Batch, [string]$Release, [switch]$All, [switch]$Archive, [switch]$DryRun)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not ($Batch -or $Release -or $All -or $Archive)) { Get-Content $PSCommandPath -TotalCount 9 | Select-Object -Skip 5; exit 2 }
$current = 'migrated-page-content-edam'
$n = 0; $skipped = 0; [long]$bytes = 0
$seen = @{}
foreach ($row in Import-Csv -Path 'packages.tsv' -Delimiter "`t") {
  $isCurrent = $row.source -eq $current
  if ($Batch -and -not ($isCurrent -and $row.path -like "*$Batch*")) { continue }
  if ($Release -and $row.release -ne $Release) { continue }
  if ($All -and -not $isCurrent) { continue }
  if ($Archive -and $isCurrent) { continue }
  $dest = if ($isCurrent) { $row.path } else { 'archive/' + ($row.source -replace '/', '-') + '/' + $row.path }
  $dest = $dest -replace '/', [IO.Path]::DirectorySeparatorChar
  if ((Test-Path $dest) -and ((Get-FileHash -Algorithm SHA256 $dest).Hash -eq $row.sha256.ToUpper())) { $skipped++; continue }
  $n++; $bytes += [long]$row.size
  if ($DryRun) { Write-Output ("{0} ({1} MB)" -f $dest, [math]::Floor([long]$row.size / 1MB)); continue }
  New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null
  # the same file at another path in this run: copied, not downloaded again
  if ($seen.ContainsKey($row.sha256) -and (Test-Path $seen[$row.sha256])) { Copy-Item $seen[$row.sha256] $dest; Write-Output "copied $dest"; $bytes -= [long]$row.size; continue }
  $ok = $false
  foreach ($t in 1..3) {
    & curl.exe -fsSL --retry 3 -o "$dest.part" $row.url
    if ((Test-Path "$dest.part") -and ((Get-FileHash -Algorithm SHA256 "$dest.part").Hash -eq $row.sha256.ToUpper())) { $ok = $true; break }
    Write-Output "retry ${t}: $dest"; Start-Sleep -Seconds 5
  }
  if (-not $ok) { throw "checksum mismatch: $dest" }
  Move-Item -Force "$dest.part" $dest
  $seen[$row.sha256] = $dest
  Write-Output ("downloaded {0} ({1} MB)" -f $dest, [math]::Floor([long]$row.size / 1MB))
}
$verb = if ($DryRun) { 'to download' } else { 'downloaded' }
Write-Output ("{0} file(s) {1}, {2} MB; {3} already there" -f $n, $verb, [math]::Floor($bytes / 1MB), $skipped)
