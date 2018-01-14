$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$bits     = Get-OSArchitectureWidth
$zipFile  = gi $toolsDir\primesieve-*-win$bits-console.zip

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    Destination    = $toolsDir
    File           = $zipFile
}

Write-Host "Installing $bits-bit primesieve..."
Get-ChocolateyUnzip @packageArgs
