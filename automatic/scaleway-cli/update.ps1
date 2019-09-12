import-module au

$releases = 'https://github.com/scaleway/scaleway-cli/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function getReleases {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re  = "scw-windows-(i386|amd64).exe"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 2 -expand href

    $checksums_url_partial = $download_page.links | Where-Object href -Match "SHA256SUMS" | Select-Object -First 1 -ExpandProperty href
    $checksums_url = 'https://github.com' + $checksums_url_partial
    $checksums_result = Invoke-WebRequest -Uri $checksums_url -UseBasicParsing
    $checksums = [regex]::Matches($checksums_result.toString(), "\n(.+)\sscw-windows-(?:i386|amd64).exe\n").captures.groups

    $version_temp = $download_page.links | Where-Object href -match "scw_(\d*\.\d*)_amd64.deb"
    $version = $version_temp[0] -split '_' | Select-Object -Last 1 -Skip 1
    $url32 = 'https://github.com' + $url[0]
    $url64 = 'https://github.com' + $url[1]
    $checksum64 = $checksums[3].toString().trim()
    $checksum32 = $checksums[1].toString().trim()

    return @{URL32 = $url32; URL64 = $url64; Version = $version; Checksum32 = $checksum32; Checksum64 = $checksum64}
}

function global:au_GetLatest {
    return getReleases
}
update
