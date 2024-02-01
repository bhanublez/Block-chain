pragma solidity ^0.8.0;

contract InheritanceGrading {
    struct Student {
        string name;
        uint256 rollNo;
        uint256[] marks;
        string grade;
    }

    mapping(uint256 => Student) public students;

    function addStudent(string memory _name, uint256 _rollNo, uint256[] memory _marks) internal {
        require(bytes(_name).length > 0, "Student name cannot be empty");
        require(_rollNo > 0, "Invalid roll number");
        require(_marks.length > 0, "Marks cannot be empty");

        students[_rollNo] = Student(_name, _rollNo, _marks, "");
    }

    function assignGrade(uint256 _rollNo) internal {
        require(_rollNo > 0, "Invalid roll number");
        
        uint256 totalMarks = 0;
        for (uint256 i = 0; i < students[_rollNo].marks.length; i++) {
            totalMarks += students[_rollNo].marks[i];
        }

        if (totalMarks >= 80) {
            students[_rollNo].grade = "A";
        } else if (totalMarks >= 60) {
            students[_rollNo].grade = "B";
        } else {
            students[_rollNo].grade = "C";
        }
    }
}

contract AssignGrade is InheritanceGrading {
    function addStudentWithGrade(string memory _name, uint256 _rollNo, uint256[] memory _marks) public {
        super.addStudent(_name, _rollNo, _marks);
        super.assignGrade(_rollNo);
    }
}

contract DisplayGrade is InheritanceGrading {
    function getStudentGrade(uint256 _rollNo) public view returns (string memory) {
        return students[_rollNo].grade;
    }
}
