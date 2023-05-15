# PowerShell basics



## Basic Commands

- `Get-Help`: Displays help topics and cmdlet descriptions for PowerShell.
- `Get-Command`: Lists all available PowerShell commands.
- `Get-Service`: Gets a list of all the services running on the computer.
- `Get-Process`: Gets a list of all the running processes on the computer.
- `Get-Item`: Gets the item (file, directory, or other item) at the specified location.
- `Set-Location`: Changes the current working directory in PowerShell.
- `New-Item`: Creates a new file, directory, or other item at the specified location.
- `Remove-Item`: Deletes the specified file, directory, or other item.
- `Copy-Item`: Copies a file, directory, or other item from one location to another.

## Basic Syntax

- `cmdlet -parameter value`: Most PowerShell commands follow this syntax, where the cmdlet is the name of the command, the parameter is an option for the command, and the value is the value of the option.
- `|`: The pipeline operator `|` is used to pass the output of one command to the input of another command.
- `$_`: The special variable `$_` represents the current pipeline object.
- `{ }`: Curly braces `{ }` enclose a script block, which is a series of commands that can be executed together.

## Common Aliases

PowerShell also provides many aliases that can be used instead of the full cmdlet names. Some common aliases include:

- `dir` for `Get-ChildItem`
- `cd` for `Set-Location`
- `mkdir` for `New-Item -ItemType Directory`
- `del` for `Remove-Item`
- `copy` for `Copy-Item`

## Helpful Tips

- PowerShell is not case-sensitive, so cmdlet names and parameter values can be typed in any case.
- Use the `Tab` key to auto-complete cmdlet and parameter names.
- Use the `Up` and `Down` arrow keys to cycle through previous commands.
- Use the `Ctrl+C` keyboard shortcut to stop a running command.





## List services 

- Get-Service: Gets a list of all the services that are currently running on the computer.

- Where-Object { $_.status -eq 'Stopped' }: Filters the list of services using the Where-Object cmdlet. The filter expression { $_.status -eq 'Stopped' } checks if the Status property of each service object in the pipeline is equal to "Stopped". The $_ is a special variable in PowerShell that represents the current pipeline object.

- Select-Object Name,Status: Selects only the Name and Status properties of the filtered services using the Select-Object cmdlet. This command displays the names and statuses of all stopped services on the computer.

```Get-Service | Where-Object { $_.status -eq 'Stopped' } | Select-Object Name,Status```
