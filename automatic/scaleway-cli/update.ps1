import-module au

$releases = 'https://github.com/scaleway/scaleway-cli/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function getReleases {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re  = "scw-(\d+-\d+-\d+).*-windows-x86_64.exe"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

    $checksums_url_partial = $download_page.links | Where-Object href -Match "SHA256SUMS" | Select-Object -First 1 -ExpandProperty href
    $checksums_url = 'https://github.com' + $checksums_url_partial
    $checksums_result = Invoke-WebRequest -Uri $checksums_url -UseBasicParsing
    $checksums = [regex]::Matches($checksums_result.toString(), "\n(.+)\sscw-(\d+-\d+-\d+(?:.+))-windows-x86_64.exe\n").captures.groups

    $version = $checksums[2] -split '-' -join '.'
    
    $url64 = 'https://github.com' + $url
    $checksum64 = $checksums[1].toString().trim()

    return @{URL64 = $url64; Version = $version; Checksum64 = $checksum64}
}

function global:au_GetLatest {
    return getReleases
}
update
