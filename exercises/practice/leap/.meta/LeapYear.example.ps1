function Test-LeapYear {
    <#
    .SYNOPSIS
    Given a year, report if it is a leap year.
    
    .DESCRIPTION
    Calculate whether the supplied year is a leap year. A leap year is determined from the following
    calculation:

    on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
    
    .PARAMETER year
    The year to test
    
    .EXAMPLE
    Test-LeapYear -year 2018

    Returns false

    .EXAMPLE
    Test-LeapYear -year 2020

    Returns True
    #>

    param( [int]$year )
    
    # This could be solved using the native system.datetime object
    # but that isn't in the spirit of exercism. 
    #[system.datetime]::isleapyear($year)
    
    # Instead solve using math
    if ( $year % 4 -eq 0 -and $year % 100 -ne 0 -or $year % 400 -eq 0) {
        return $True
    }
    else {
        return $False
    }
}
