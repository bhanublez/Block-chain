// SPDX - License - Identifier: MIT pragma solidity ^ 0.8.0;
contract Library { address public Librarian;
// address public User;
constructor() { Librarian = msg.sender;
} modifier only_Librarian() { require(
    Librarian == msg.sender,
    "You are not permitted!!"
);
_;
} modifier not_librarian() { require(
    msg.sender != Librarian,
    "You are registered as librarian"
);
_;
} struct userRegisteration { string Uname;
string DOJ;
address Uaddress;
uint256 No_of_Books;
bool isRegistered;
} struct Book { string BName;
string Genre;
bool isAvailable;
address BOwner;
} int256 [] private totalbooks;
mapping(uint256 => Book) public Book_details;
mapping(uint256 => userRegisteration) public User_details;
function AddBook(
    uint256 BId,
    string memory _Bname,
    string memory _Genre
) public only_Librarian { Book memory newBook = Book(
    _Bname,
    _Genre,
    true,
    0x0000000000000000000000000000000000000000
);
Book_details [BId] = newBook;
totalbooks.push(1);
} function Register(
    uint256 _Uid,
    string memory _Uname,
    string memory _DOJ,
    address _Uaddress
) public not_librarian { userRegisteration memory newUser = userRegisteration(
    _Uname,
    _DOJ,
    _Uaddress,
    0,
    true
);
User_details [_Uid] = newUser;
} function Borrow(uint256 _Bid, uint256 _Uid) public not_librarian returns (string memory) { require(
    Book_details [_Bid].isAvailable == true,
    "Book is Not Availble"
);
require(
    User_details [_Uid].isRegistered == true,
    "You're not registered"
);
Book_details [_Bid].BOwner = msg.sender;
User_details [_Uid].No_of_Books ++;
Book_details [_Bid].isAvailable = false;
return "Book issued";
} function ReturnBook(uint256 _Bid, uint256 _Uid) public not_librarian { require(
    User_details [_Uid].isRegistered == true,
    "You're not registered"
);
require(
    Book_details [_Bid].BOwner == msg.sender,
    "This book was not issued by you"
);
User_details [_Uid].No_of_Books --;
Book_details [_Bid].isAvailable = true;
Book_details [_Bid].BOwner == 0x0000000000000000000000000000000000000000;
} function Totalbooks() public view returns (uint256) { return totalbooks.length;
} }