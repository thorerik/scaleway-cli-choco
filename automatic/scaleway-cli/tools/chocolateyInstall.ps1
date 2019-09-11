$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v1.20/scw-windows-amd64.exe'
$checksum32      = 'c50e3c498350a6eafdd84a241dfc2f2de00d39891de755e4c45ae514ec660df1'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v1.20/scw-windows-i386.exe'
$checksum64    = '83aa97822ccec83d0c886d7f2894aaf9938a7703a99e716beb912a44d8a3e6cd'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64
