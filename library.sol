// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Librarian{
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    //Consider a library can have multiple books with same detail but different id
     struct Book{
        uint256 id;
        string naam;
        string author;
        uint256 price;
        bool isIssued;
    }

    
    struct student{
        string naam;
        uint256 []issedBook;
        uint studentId;
        string gender;
    }

    
    uint studentCount;
    mapping(uint=>student) studentsArr;
    uint256[] registeredStudents;


    mapping(uint256=>Book) books;
    uint size;// Number of books

    function addBook(uint256 id,string memory naam,string memory author,uint256 price ) public onlyOwner(){
        
        require(id>=0,"Invalid id");
        //Check book not adding again with same id in mapping
        for(uint i=0;i<size;i++){
            require(books[i].id!=id,"Book already hai idar");
        }

        Book memory naiBook=Book({id: id,naam: naam,author: author,price: price,isIssued: false});
        books[id]=naiBook;//Mapping kiya idar
        size++;
    }

    function getBookInfo(uint256 id) public onlyOwner() view returns(string memory naam,string memory author,uint256 price){
      
        require(books[id].id!=0,"Book not found");

        return (books[id].naam,books[id].author,books[id].price);// Mapping se nikal liya
    }

    function updateBook(uint256 id,string memory naam, string memory author,uint256 price) public onlyOwner(){
        require(books[id].isIssued==false,"Book is already issued");
        books[id].naam=naam;
        books[id].author=author;
        books[id].price=price;
    }

    function deleteBook(uint256 id) public onlyOwner(){
        require(books[id].isIssued==false,"Book is already issued , isliye delete nahi hoga");
        delete books[id];
        size--;
    }

    function getBookCount() public onlyOwner() view returns(uint256){
        return size;
    }

    function addStudent(string memory naam,uint studentId,string memory gender) public onlyOwner() {
        require(studentId>=0,"Invalid id");

        //Check kiya taki student already na ho
        for(uint i=0;i<registeredStudents.length;i++){
            require(registeredStudents[i]!=studentId,"Student already hai idar");
        }

        student memory naiStudent=student({studentId: studentId,naam: naam,issedBook: new uint256[](0),gender: gender});
        studentsArr[studentCount]=naiStudent;
        registeredStudents.push(studentId);
        studentCount++;
    }


    function getStudentInfo(uint256 id) public onlyOwner() view returns(string memory naam,uint studentId,uint256[] memory IssueBook){
        
        //Check kiya taki student already na ho
         bool isRegistered=isRegisteredStudent(id);
        if(isRegistered==false){
            revert("Student not registered");
        }
        uint i=0;
        for( i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==id){
                break;
            }
        }
        return (studentsArr[i].naam,studentsArr[i].studentId,studentsArr[i].issedBook);
    }

    function getAllStudent() public onlyOwner() view returns(student[] memory) {
        student[] memory allStudents=new student[](studentCount);
        for(uint i=0;i<studentCount;i++){
            allStudents[i]=studentsArr[i];
        }
        return allStudents;
    }

    function updateStudent(uint256 id,string memory naam,string memory gender) public onlyOwner(){
         uint i=0;
        for( i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==id){
                break;
            }
        }
        studentsArr[i].naam=naam;
        studentsArr[i].gender=gender;
    }

    function deleteStudent(uint256 id) public onlyOwner(){
         bool isRegistered=isRegisteredStudent(id);
        if(isRegistered==false){
            revert("Student not registered");
        }
        delete studentsArr[id];
        for(uint i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==id){
                delete registeredStudents[i];
            }
        }

        studentCount--;
    }

    function getStudentCount() public onlyOwner() view returns(uint256){
        return studentCount;
    }

    function issueBook(uint256 id,uint256 bid) public onlyOwner(){
       
     //Check kiya taki student already na ho
        bool isRegistered=isRegisteredStudent(id);
        if(isRegistered==false){
            revert("Student not registered");
        }


        require(books[bid].isIssued==false,"Book is already issued");
        books[bid].isIssued=true;
         uint i=0;
        for( i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==id){
                break;
            }
        }
        studentsArr[i].issedBook.push(bid);
    }

    function isRegisteredStudent(uint256 id) private view onlyOwner() returns(bool){
        for(uint i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==id){
                return true;
            }
        }
        return false;
    }

   function getAllIssuedBooks(uint256 id) public view onlyOwner() returns(uint256[] memory IssuedBooks){
         uint i=0;
        for( i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==id){
                break;
            }
        }
        return studentsArr[i].issedBook;
    }

    function returnBook(uint256 sid,uint256 bid) public onlyOwner(){
         bool isRegistered=isRegisteredStudent(sid);
        if(isRegistered==false){
            revert("Student not registered");
        }
        require(books[bid].isIssued==true,"Book toh issued hi nahi thi toh book tere pass kaise aayi?");
        books[bid].isIssued=false;

         uint i=0;
        for( i=0;i<registeredStudents.length;i++){
            if(registeredStudents[i]==sid){
                break;
            }
        }
        for(uint j=0;j<studentsArr[i].issedBook.length;j++){
            if(studentsArr[i].issedBook[j]==bid){
                delete studentsArr[i].issedBook[j];
            }
        }
    }

}
