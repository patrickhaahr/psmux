$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/marlocarlo/pmux/releases/download/v0.1.0/pmux-windows-x86_64.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'TODO_SHA256_HASH'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Create shims for both pmux and tmux
$pmuxPath = Join-Path $toolsDir "pmux-windows-x86_64\pmux.exe"
$tmuxPath = Join-Path $toolsDir "pmux-windows-x86_64\tmux.exe"

Install-BinFile -Name "pmux" -Path $pmuxPath
Install-BinFile -Name "tmux" -Path $tmuxPath
