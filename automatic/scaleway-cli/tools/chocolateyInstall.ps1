$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.4/scw-2.2.4-windows-386.exe'
$checksum32      = '488edc94713606d86e410a05f8347d30ec5fd7284ee815032efd00eacbb82e29'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.2.4/scw-2.2.4-windows-x86_64.exe'
$checksum64    = '87e8649979fbd306383e84a4cc5516bd8ec0e41324daac915fb36ce3e60bc5e0'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

