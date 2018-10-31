$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = "v1.17"
$url_base = "https://github.com/scaleway/scaleway-cli/releases/download/${version}/"
$url        = "${url_base}/scw-windows-i386.exe"
$url64      = "${url_base}/scw-windows-amd64.exe"

$packageArgs = @{
  checksum      = '204D61EC8BF68D3C07B336E6956123C1D14D65B30A528BC7671129B7C68D9536'
  checksumType  = 'sha256'
  checksum64    = '7F2E8F6E50EBCDF2FCEAC8F9B7342548FF5C5C85387B72FD6D241BD6B2FFF513'
  checksumType64= 'sha256'

}
Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url -Url64 $url64 -Checksum $packageArgs.checksum -ChecksumType $packageArgs.checksumType -Checksum64 $packageArgs.checksum64 -ChecksumType64 $packageArgs.checksumType64
