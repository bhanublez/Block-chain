// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Problem Statement 3: Classroom Grades Registry
// Objective: Build a contract GradesRegistry to record and retrieve students' grades.
// •	Use a struct named Grade that includes properties for the student's ID and their grade.
// •	Implement a mapping from student ID to their Grade.
// •	Write a function for adding or updating a student's grade.
// •	Develop a function to retrieve a student's grade by their ID.

contract GradesRegistry{
    struct Grade{
        uint256 studentID;
        uint256 grade;
    }
    mapping(uint256 => Grade) private grades;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You not owner!!!");
        _;
    }

    event GradeUpdated(uint256 indexed studentID, uint256 grade); // log maintain karata hai
    function updateGrade(uint256 studentID, uint256 grade) public {
        grades[studentID] = Grade(studentID, grade);
        emit GradeUpdated(studentID, grade);

    }

    function checkGrade(uint256 studentID) public view returns(uint256) {
        return grades[studentID].grade;
    }

    function checkGradeAtAddresss(uint256 studentID) public view onlyOwner returns(uint256) {
        return grades[studentID].grade;
    }
}