$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.5.6/scaleway-cli_2.5.6_windows_386.exe'
$checksum32      = 'edfbd27a710c7014232173ef92df46bb3edab025234302f9dbf1419f8789b023'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.5.6/scaleway-cli_2.5.6_windows_amd64.exe'
$checksum64    = '7afecbc6e1e1ebebefa08dcf66c346eeb137adde69f142ff8237fa65b580f1c9'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

