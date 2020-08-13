$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.0.0/scw-2-0-0-windows-386.exe'
$checksum32      = 'a07b74ce1654bc147427fa4e2ee9abad17c4e0de8d0ae143c7a98ef73db318a0'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.0.0/scw-2-0-0-windows-x86_64.exe'
$checksum64    = '53c512989ffa403414d0b2bed22156ee6e06d481d2e82dda7d991d8beeb07f66'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

