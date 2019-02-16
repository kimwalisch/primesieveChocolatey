# Release instructions

* Delete old ```tools/primesieve-*.*-win64-console.zip```
* Copy new ```primesieve-*.*-win64-console.zip``` to ```tools``` dir
* Replace all old version numbers with the new version number
* Replace old checksum with new checksum in ```tools/VERIFICATION.txt```

# Build instructions

* Open a PowerShell and cd into the ```primesieveChocolatey``` repo
* Run ```choco pack```

# Submit new Chocolatey package

* Get ```API-KEY-HASH``` key from https://chocolatey.org/account
* Open a new PowerShell as Administrator and cd into the primesieveChocolatey repo
* ```choco apikey --key API-KEY-HASH --source https://push.chocolatey.org/```
* ```choco push primesieve.*.*.nupkg --source https://push.chocolatey.org/```
