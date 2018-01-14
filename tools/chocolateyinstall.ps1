$ErrorActionPreference = 'Stop'
$toolsDir  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$osBitness = Get-OSArchitectureWidth
$zipFile   = gi $toolsDir\primesieve-*-win$osBitness-console.zip

# Unzip either 32-bit or 64-bit primesieve-*.zip
Get-ChocolateyUnzip -FileFullPath $zipFile -Destination $toolsDir

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileType       = 'exe'
    SoftwareName   = 'Primesieve*'
    File           = gi $toolsDir\primesieve.exe
    File64         = gi $toolsDir\primesieve.exe
    SilentArgs     = "1000000 -q"
    validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
