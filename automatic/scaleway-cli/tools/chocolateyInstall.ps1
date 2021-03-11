$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.3.0/scw-2.3.0-windows-386.exe'
$checksum32      = '36be4855c847c4e261fa42a2d58800addd3b0c8355aea2658a3283e3783871ab'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v2.3.0/scw-2.3.0-windows-x86_64.exe'
$checksum64    = '484c36cf1d96c07e17b2fef15cde9aabc59da9e32de4d073dd38a4fe8cace746'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64

