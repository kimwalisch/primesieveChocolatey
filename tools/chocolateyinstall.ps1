$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName = $env:ChocolateyPackageName
    Destination = $toolsDir
    File64      = gi $toolsDir\primesieve-*-win64-console.zip
}

Get-ChocolateyUnzip @packageArgs
