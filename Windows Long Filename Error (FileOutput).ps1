Get-ChildItem -Path "LOCATION" -Recurse -File |Where-Object {$.FullName.Length -ge LENGH } | ForEach-Object{$.FullName} > “SAVE LOCATION”
