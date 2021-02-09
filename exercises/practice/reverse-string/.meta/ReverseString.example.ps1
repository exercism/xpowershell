Function Get-ReverseString {
    <#
    .SYNOPSIS
    Reverse a string

    .DESCRIPTION
    Reverses the string in its entirety. That is it does not reverse each word in a string individually.

    .PARAMETER Forward
    The string to be reversed

    .EXAMPLE
    Get-ReverseString "PowerShell"
    
    This will return llehSrewoP

    .EXAMPLE
    Get-ReverseString "racecar"

    This will return racecar as it is a palindrome
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Position=1, ValueFromPipeline=$true)]
        [string]$Forward
    )

    # We could use:
    # $charArry = $Forward.ToCharArray()
    # [array]::Reverse($charArray)
    # Return -join($charArry)

    # Doing this ourselves (and this is probably easier to understand):
    $reversed = ""
    
    for($i = $Forward.Length; $i -gt 0; $i--){
        $reversed += $Forward[$i - 1] # Use -1 as arrays are 0 based so $Forward.Length is 1 more than the last element index of the array
    }

    return $reversed
}
