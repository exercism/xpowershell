function Get-HelloWorld {
	<#
    .SYNOPSIS
    Outputs "Hello World"
    
    .DESCRIPTION
    Output "Hello World" or "Hello <Name>" if Name is supplied to the CmdLet.
    
    .PARAMETER person
    Name of the person to display. If not supplied, Hello World should be displayed
    
    .EXAMPLE
    Get-HelloWorld
    #>
	param( [string]$person = "World")

	return "Hello, $person!"
}
