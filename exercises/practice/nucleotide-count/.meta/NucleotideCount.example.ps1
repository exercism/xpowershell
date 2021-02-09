Function Get-NucleotideCount() {
    <#
    .SYNOPSIS
    Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.
    
    .DESCRIPTION
    The genetic language of every living thing on the planet is DNA.
    DNA is a large molecule that is built from an extremely long sequence of individual elements called nucleotides.
    4 types exist in DNA and these differ only slightly and can be represented as the following symbols: 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' thymine.

    The function counts the occurances of A, C, G and T in the supplied strand. It then outputs in the format:

    A:0, C:0, G:0, T:0
    
    .PARAMETER Strand
    The DNA strand to count
    
    .EXAMPLE
    Get-NucleotideCount -Strand "ACGTAGCTT"

    Retuns: A:2 C:2 G:2 T:3
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand = ""
    )

    $nucleotides = "ACGT"
    $nucleotideRegEx = "^[$($nucleotides)]+$"

    # Test for valid Strand values (empty string or made up of a string of ACGT characters in any order)
    If ($Strand -ne "" -and $Strand -notmatch $nucleotideRegEx){
        Throw "Invalid nucleotide in strand"
    }

    $result = ""

    # Count the nucleotides in the strand
    ForEach($nucleotide in $nucleotides.ToCharArray()){
        $count = 0
        For($i = 0; $i -lt $Strand.Length; $i++){
            # Test if the current charcter in the strand is the nucleotide we are counting
            If ($Strand[$i] -eq $nucleotide){
                $count ++
            }
        }

        # Add a space to the output if needed
        If ($result -ne "") {
            $result += " "
        }
        
        $result += ("{0}:{1}" -f $nucleotide, $count)
    }

    Return $result
}
