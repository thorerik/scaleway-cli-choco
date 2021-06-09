$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.3.1/scw-2.3.1-windows-386.exe'
$checksum32      = '85f69b8139dd632b8182536ea400bc2afc8fc7c0bdc6e67c88754853fe88b69b'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.3.1/scw-2.3.1-windows-x86_64.exe'
$checksum64    = '3aa8f1251c5bc137225af83bbad2d86df19fcda262b4724d84ffac2e712448e9'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

