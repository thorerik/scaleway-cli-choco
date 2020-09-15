$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.1.0/scw-2-1-0-windows-386.exe'
$checksum32      = '6f38037044e318ebed31305102c1ab19bbde7faa6bb3a264281d764a9d68014b'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.1.0/scw-2-1-0-windows-x86_64.exe'
$checksum64    = '47882670c292e1e44382ddb8aa085e0c652781e448de2850e4639d8f8677434f'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

