$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName = $env:ChocolateyPackageName
    Destination = $toolsDir
    File        = gi $toolsDir\primesieve-*-win32-console.zip
    File64      = gi $toolsDir\primesieve-*-win64-console.zip
}

Get-ChocolateyUnzip @packageArgs
