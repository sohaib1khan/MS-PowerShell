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




## PS verbs and parameters

Verbs:

This PowerShell command uses the Get-Help cmdlet to retrieve information about approved verbs that can be used in PowerShell cmdlet names.

The get-verb parameter specifies that we want to get information about verbs.

The | more pipeline operator is used to display the results one page at a time in the console, allowing the user to scroll through the results as needed.

Overall, this command retrieves a list of approved verbs that can be used when naming custom cmdlets in PowerShell and displays them in a paginated format in the console.


```Get-Help get-verb | more```


Parameters:

This PowerShell command uses the Get-Help cmdlet to retrieve information about the common parameters that can be used in PowerShell cmdlets.

The about_CommonParameters parameter specifies that we want help documentation specifically about common parameters.

By default, the Get-Help cmdlet displays the help content in the console window. However, you can also use the -Online parameter to view the documentation in a web browser or the -ShowWindow parameter to view the documentation in a separate window.




## Cmdlet:

A cmdlet (pronounced "command-let") is a lightweight command that is used in PowerShell to perform a specific task. Cmdlets are the building blocks of PowerShell and are designed to be used in combination with each other to create complex scripts and automate administrative tasks.

Cmdlets follow a consistent naming convention of "Verb-Noun" (ex, Get-Process, Set-ItemProperty), where the verb specifies the action to be performed and the noun specifies the object on which the action is performed.


Cmdlets can be used interactively from the PowerShell command prompt or can be incorporated into scripts for more complex tasks. PowerShell provides hundreds of built-in cmdlets for performing tasks such as managing files and folders, configuring system settings, and managing network connections. Additionally, PowerShell allows you to create your own custom cmdlets to extend the functionality of the shell to meet your specific needs.


## Function

A PowerShell function is a named block of reusable code that performs a specific task or a series of tasks. Functions allow you to encapsulate a set of instructions and parameters into a single unit, making your code modular and easier to manage.

To define a function in PowerShell, you use the function keyword followed by the function name, a set of parentheses for parameters (if any), and a set of curly braces { } to enclose the function code. Here's a basic example:

```
function SayHello {
    param(
        [string]$Name
    )

    Write-Host "Hello, $Name!"
}
```

In this example, we define a function named SayHello that takes a single parameter $Name. Inside the function, we use the Write-Host cmdlet to output a greeting message that includes the provided name.

Once the function is defined, you can call it by using its name and passing any required arguments. For example:

```SayHello -Name "John"```


This will invoke the SayHello function and pass the value "John" as the $Name parameter. The function will then execute the code block inside the function and output the greeting message.

Functions in PowerShell are powerful and flexible, allowing you to create reusable code blocks, organize your scripts, and make your code more modular and maintainable. You can also use functions to return values or manipulate data within the function's scope.




## Anatomy of PS command: 
In the given example, a PowerShell command that retrieves information about services on multiple computers

- `get-service` is the cmdlet (command-let) being used, which retrieves information about all the running services on a computer.
- `-name P*` is a parameter used with the get-service cmdlet, which filters the list of services returned by the command to only those services whose names begin with the letter "P".
- `-ComputerName Client1, Client2` is another parameter used with the get-service cmdlet, which specifies the names of the remote computers where the command will be executed. In this case, the get-service cmdlet will retrieve information about running services on two remote computers named "Client1" and "Client2".
- `PS:` is the PowerShell prompt, indicating that the command can be executed.
- The greater-than symbol `>` or `:` indicates that the PowerShell command prompt is ready to accept input. The command is executed when the Enter key is pressed.

PS:> get-service -name P* -ComputerName Client1, Client2


Same command as above except using `aliases`

`PS: Gsv P* -Comp Client1, Client2`
`PS> Get-Command -Name *Firewall* -CommandType function `

###### 3 Important help commands 

`Get-command:` The Get-Command cmdlet allows you to retrieve a list of all available commands in PowerShell. It provides information about cmdlets, functions, aliases, and more. This command is helpful when you want to explore available commands or find a specific command for a task.

`PS> Get-Command -Verb Get -Noun *DNS* `


`Get-help:` The Get-Help cmdlet is used to access the detailed help documentation for PowerShell commands. It provides information on how to use cmdlets, their parameters, examples, and more. You can specify a specific command or topic to get detailed information, such as `Get-Help Get-Process or Get-Help about_Variables.`

`PS> man -name get-command -detailed`

`PS> get-help -name get-command -detailed`

`PS> help about_command_syntax`

`PS> get-help -name *dns*`


`Get-Member:` The Get-Member cmdlet enables you to explore the properties and methods of PowerShell objects. It displays all the available members (properties and methods) of an object type. This command is useful when you want to understand the structure and capabilities of an object, such as when working with variables, cmdlet output, or object-oriented programming in PowerShell.

These three commands— `Get-Command`, `Get-Help`, and `Get-Member` are essential for discovering and understanding PowerShell commands, accessing their detailed documentation, and exploring object properties and methods. They provide valuable resources for learning, exploring, and utilizing PowerShell effectively.





###### Powershell Formatting

`Format-List` cmdlet allows you to specify which properties of an object you want to display and formats the output as a list, showing each property on a separate line.

For example:

```Get-Process | Format-List Name, Id, CPU```
In this example, we use the Get-Process cmdlet to retrieve a list of running processes. The output of this cmdlet contains various properties such as Name, Id, CPU usage, and more. By piping the output to Format-List and specifying the properties Name, Id, and CPU, the command formats the output in a list format, displaying each process's name, ID, and CPU usage on separate lines.


The Format-List cmdlet is useful when you want to view detailed information about specific properties of objects, particularly when dealing with complex or multi-property objects. It provides a more readable and structured view of the object's properties and their values.







