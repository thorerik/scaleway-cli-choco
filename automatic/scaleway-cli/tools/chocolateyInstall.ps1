$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.4.0/scw-2.4.0-windows-386.exe'
$checksum32      = 'fb3042a12619302e20e9c97803182d0c90a9f12dbcbc3b6b91f73ec828bc7476'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.4.0/scw-2.4.0-windows-x86_64.exe'
$checksum64    = 'b3d20738c8d266e7b37611a7a12f7ea26073dbef6bb7c34499a590862b25c443'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

