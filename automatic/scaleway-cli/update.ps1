import-module au

$releases = 'https://github.com/scaleway/scaleway-cli/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function getReleases {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re32  = "scw-(\d+-\d+-\d+).*-windows-386.exe"
    $url32 = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

    $re64  = "scw-(\d+-\d+-\d+).*-windows-x86_64.exe"
    $url64 = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

    $checksums_url_partial = $download_page.links | Where-Object href -Match "SHA256SUMS" | Select-Object -First 1 -ExpandProperty href

    $checksums_url = 'https://github.com' + $checksums_url_partial
    $checksums_result = Invoke-WebRequest -Uri $checksums_url -UseBasicParsing

    # Fetch checksums for each variant and gather version number
    $checksum64 = [regex]::Matches($checksums_result.toString(), "(.+)\s+scw-(\d+-\d+-\d+)-windows-x86_64.exe").captures.groups
    $checksum32 = [regex]::Matches($checksums_result.toString(), "(.+)\s+scw-(\d+-\d+-\d+)-windows-386.exe").captures.groups

    $version = $checksum32[2] -split '-' -join '.'

    $url32 = 'https://github.com' + $url32
    $checksum32 = $checksum32[1].toString().trim()

    $url64 = 'https://github.com' + $url64
    $checksum64 = $checksum64[1].toString().trim()

    return @{
        Version = $version;
        URL32 = $url32;
        Checksum32 = $checksum32
        URL64 = $url64;
        Checksum64 = $checksum64
    }
}

function global:au_GetLatest {
    return getReleases
}
update
