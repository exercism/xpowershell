$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.tests\.', '.'
. "$here\$sut"

Describe "Get-TwoFerTests" {
	It "Enter1stTestHere" {
		Throw "Tests not implemented"
	}
}
