class Student {
    # Student properties Grade and Name
    [int]$Grade
    [string]$Name

    # Student constructors - allows the instantiation of a student object with their properties specified
    Student(){}
    Student([int]$grade,[string]$name){
        $this.Grade = $grade
        $this.Name = $name
    }
}

class Roster {
    # An array of Students is the property of the Roster type
    [Student[]]$Student

    # The Add Student method allows the possibility to add Student objects to the Roster
    [void]AddStudent([int]$grade, [string]$name){
        $this.Student += [Student]::new($grade,$name)
    }

    # GetRoster without any arguments returns a sorted list of all students
    [Student[]]GetRoster(){
        return $this.Student | Sort-Object -Property Grade, Name
    }

    # GetRoster is overloaded with the grade as the argument and returns a sorted list of all students from the grade specified
    [Student[]]GetRoster([int]$grade){
        return $this.Student | Where-Object {$_.grade -eq $grade} | Sort-Object -Property Grade, Name
    }
}