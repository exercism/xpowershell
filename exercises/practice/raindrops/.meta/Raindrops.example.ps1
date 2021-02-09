Function Get-Raindrops() {
    <#
    .SYNOPSIS
    Given a number convert it to Pling, Plang, Plong if it has factors of 3, 5 or 7.
    
    .DESCRIPTION
    Convert a number to a string, the contents of which depend on the number's factors.

    - If the number has 3 as a factor, output 'Pling'.
    - If the number has 5 as a factor, output 'Plang'.
    - If the number has 7 as a factor, output 'Plong'.
    - If the number does not have 3, 5, or 7 as a factor, just pass the number's digits straight through.
    
    .PARAMETER Rain
    The number to evaluate
    
    .EXAMPLE
    Get-Raindrops -Rain 35

    This will return PlangPlong as it has factors of 5 and 7

    .EXAMPLE
    Get-Raindrops -Rain 12121

    This will return 12121 as it does not contain factors of 3, 5 or 7 so the value is passed through.
    #>
    [CmdletBinding()]
    Param(
        [int]$Rain
    )

    # Initialize the result
    [string]$Result = ""

    # Use a hashtable to list the factors and what they are replaced with
    $factorRain = @{
        3 = "Pling";
        5 = "Plang";
        7 = "Plong";
    }

    # Loop over the hashtable testing the factors and building up the result.
    # NOTE: You must sort hashtables if order is important. See: https://blogs.technet.microsoft.com/heyscriptingguy/2014/09/28/weekend-scripter-sorting-powershell-hash-tables/
    Foreach($factor in ($factorRain.GetEnumerator() | Sort-Object -Property Name)){
        If($Rain % $factor.Name -eq 0){
            $Result += $factor.Value
        }
    }

    # Deal with the case that no factors are found so passthrough the original value
    If ([string]::IsNullOrEmpty($Result)){
        $Result = $Rain.ToString()
    }

    # Return the resulting string
    Return $Result
}