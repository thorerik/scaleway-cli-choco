$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.0/scw-2-2-0-windows-386.exe'
$checksum32      = '4e2be7b0c862ca0d0f15999b01e5b3b2ffd256f1ea4a14f0de5289b9bfeaca51'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.0/scw-2-2-0-windows-x86_64.exe'
$checksum64    = '766f261db25c24e1b04abc8c096dfc5264b919c2def93fd61611305a7e2dd71f'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

