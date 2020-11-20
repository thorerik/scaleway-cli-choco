$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.3/scw-2.2.3-windows-386.exe'
$checksum32      = '38ebd835223c62b117173eeaf30a15c480fdfe5489a4ceab8964556b16d17f53'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.3/scw-2.2.3-windows-x86_64.exe'
$checksum64    = '62dab23b6b15107eddfb603f4f43d2787e754d5bcbc04c523b02306ef88d66c3'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

