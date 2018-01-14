$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileType       = 'exe'
    SoftwareName   = 'Primesieve*'
    File           = gi $toolsDir\primesieve-3.6-win32-console\primesieve.exe
    File64         = gi $toolsDir\primesieve-6.2-win64-console\primesieve.exe
    SilentArgs     = "1000000 -q"
    validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
