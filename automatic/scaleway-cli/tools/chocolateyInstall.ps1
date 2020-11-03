$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.2/scw-2.2.2-windows-386.exe'
$checksum32      = '61ab43f99fb6b66f7e0cc75ea961cf286ff9ac7e06ba51c2390608ec7f976459'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.2/scw-2.2.2-windows-x86_64.exe'
$checksum64    = 'f4d1ced66d53d7746c06e83f40b2e8c2297c515ba2b97cc26125f9d071845665'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

