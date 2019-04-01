$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = "v1.19"
$url_base = "https://github.com/scaleway/scaleway-cli/releases/download/${version}/"
$url        = "${url_base}/scw-windows-i386.exe"
$url64      = "${url_base}/scw-windows-amd64.exe"

$packageArgs = @{
  checksum      = '883C8A66CD5A35D85FA89B1FF5705A38CBB7AC6CADB592BD404DC7C52C3E54D3'
  checksumType  = 'sha256'
  checksum64    = '55EB14959AFF9374E282B3DBDD0E17FE84A604C91BF9B5B6507CB02ECDDC0C25'
  checksumType64= 'sha256'

}
Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url -Url64 $url64 -Checksum $packageArgs.checksum -ChecksumType $packageArgs.checksumType -Checksum64 $packageArgs.checksum64 -ChecksumType64 $packageArgs.checksumType64
