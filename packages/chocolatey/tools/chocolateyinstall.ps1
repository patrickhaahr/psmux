$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/marlocarlo/psmux/releases/download/v0.2.7/psmux-v0.2.7-windows-x64.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'F8E2EEE149786F8E343A854094886FE63B967F55ECE883094E7D23282672D1A1'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Create shims for psmux, pmux, and tmux
$psmuxPath = Join-Path $toolsDir "psmux.exe"
$pmuxPath = Join-Path $toolsDir "pmux.exe"
$tmuxPath = Join-Path $toolsDir "tmux.exe"

Install-BinFile -Name "psmux" -Path $psmuxPath
Install-BinFile -Name "pmux" -Path $pmuxPath
Install-BinFile -Name "tmux" -Path $tmuxPath
