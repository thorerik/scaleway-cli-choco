$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = "v1.18"
$url_base = "https://github.com/scaleway/scaleway-cli/releases/download/${version}/"
$url        = "${url_base}/scw-windows-i386.exe"
$url64      = "${url_base}/scw-windows-amd64.exe"

$packageArgs = @{
  checksum      = '090B62518347B0689843FD25DDA956838E2FF818E6CCF6E92D816CD3BD3A1D3A'
  checksumType  = 'sha256'
  checksum64    = '32628C57F6F6AD47F0287B7D567A7AE637B9086EA5304AC810A63EF7CEF1C533'
  checksumType64= 'sha256'

}
Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url -Url64 $url64 -Checksum $packageArgs.checksum -ChecksumType $packageArgs.checksumType -Checksum64 $packageArgs.checksum64 -ChecksumType64 $packageArgs.checksumType64
