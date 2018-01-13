$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/kimwalisch/primesieve/releases/download/v6.2/primesieve-6.2-win64-console.zip'
$url        = 'https://github.com/kimwalisch/primesieve/releases/download/v3.6/primesieve-3.6-win32-console.zip'
$osBitness  = Get-ProcessorBits

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'primesieve*'

  checksum      = '0e08cad6beecf21629b81074307c88ae0794252cd86bc5c2b14029dbc5128574'
  checksumType  = 'sha256'
  checksum64    = '366cb96c596073a3211de6eb2292da2be806c4521bd35a652a5bf3430c82641c'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

if ($osBitness -eq 64)
{
  Install-ChocolateyZipPackage $packageName $url64 -checksum64 $checksum64 -checksumType64 $checksumType64 $toolsDir
}
else
{
  Install-ChocolateyZipPackage $packageName $url -checksum $checksum -checksumType $checksumType $toolsDir
}
