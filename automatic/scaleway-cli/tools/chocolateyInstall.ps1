$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.1/scw-2.2.1-windows-386.exe'
$checksum32      = '3fdd9390faf1e087dd43500e15ca3d4dffec7424e737cbef6bb3afee947fd337'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.1/scw-2.2.1-windows-x86_64.exe'
$checksum64    = 'a511602538ffe9683b3ef29760e6bd4915381833b419c8a2def9f83a6cacdbea'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

