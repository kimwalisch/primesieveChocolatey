$packageName = $env:ChocolateyPackageName
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://github.com/kimwalisch/primesieve/releases/download/v6.2/primesieve-6.2-win64-console.zip'
$url         = 'https://github.com/kimwalisch/primesieve/releases/download/v3.6/primesieve-3.6-win32-console.zip'
$checksum    = '0e08cad6beecf21629b81074307c88ae0794252cd86bc5c2b14029dbc5128574'
$checksum64  = '366cb96c596073a3211de6eb2292da2be806c4521bd35a652a5bf3430c82641c'

Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName `
                             -FileType 'exe' `
                             -Url $url `
                             -Url64bit $url64 `
                             -Checksum $checksum `
                             -Checksum64 $checksum64 `
                             -ChecksumType 'sha256' `
                             -SilentArgs '/VERYSILENT' `
                             -ValidExitCodes @(0) `
                             -UnzipLocation $toolsDir
