# Windows Long Filename Error

There is a limitation in windows on the lengh of file names that can stop them being processed (copied, moved, deleted etc), and results in the error message “The specified path, file name, or both are too long. The fully qualified file name must be less than 260 characters, and the directory name must be less than 248 characters”.

It can be hard in large batches of files to find the culprit (or culprits), and this powershell script is to make the process easier by searching folders recurvisley for the offending file names. You need to update a few variables to run the script.


## User Variables
You need to update: 
-	**Location –** The location of the files and folders to be assessed. 
-	**Lengh –** Lengh of string to be identified.
-	**Save Location –** Path to where results should be saved. The specific file must be specified in the string (i.e. results.txt).


## The Command
There are two different versions of the script, one to print the results to the terminal, the other to print results to a nominated text file.

- *Display results in terminal:*
  - Get-ChildItem -Path "**LOCATION**" -Recurse -File |Where-Object {$_.FullName.Length -ge **LENGH** } | ForEach-Object{$_.FullName}

- *Save results to a text file:*
  - Get-ChildItem -Path "**LOCATION**" -Recurse -File |Where-Object {$_.FullName.Length -ge **LENGH** } | ForEach-Object{$_.FullName} > “**SAVE LOCATION**”



## Example
- *Example 1 – Print to Terminal*
  - Get-ChildItem -Path "C:\Users\Bob|Downloads\ " -Recurse -File |Where-Object {$_.FullName.Length -ge 260 } | ForEach-Object{$_.FullName}

- *Example 1 – Save to file*
  - Get-ChildItem -Path "C:\Users\Bob\Downloads\ " -Recurse -File |Where-Object {$_.FullName.Length -ge 260 } | ForEach-Object{$_.FullName} > C:\Users\Bob\Documents\Results.txt

## To Do
- Update script to let users set their own variables as part of the script.
- Complete README.md document.



