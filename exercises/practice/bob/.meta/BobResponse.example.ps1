Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    # Clear whitespace around the input
    $HeyBob = $HeyBob.Trim()

    # The three types of input
    $shouting = $false
    $question = $false
    $saidnothing = $false

    # Tests for the types of input
    If (($HeyBob.ToUpper() -ceq $HeyBob) -and ($HeyBob -cmatch "[A-Za-z]")) { $shouting = $true }
    If ($HeyBob[$HeyBob.Length - 1] -eq "?") { $question = $true }
    If ([string]::IsNullOrEmpty($HeyBob)) { $saidnothing = $true }

    # Determine the output based on the results of the tests
    If ($saidnothing) { Return "Fine. Be that way!" }
    If ($question -and $shouting ) { Return "Calm down, I know what I'm doing!" }
    If ($question) { Return "Sure." }
    If ($shouting) { Return "Whoa, chill out!" }

    # Default return value
    Return "Whatever."
}
