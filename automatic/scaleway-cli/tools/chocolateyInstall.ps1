$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v1.20/scw-windows-i386.exe'
$checksum64    = '83aa97822ccec83d0c886d7f2894aaf9938a7703a99e716beb912a44d8a3e6cd'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url64 $url64 -Checksum64 $checksum64 -ChecksumType64 $checksumType64
