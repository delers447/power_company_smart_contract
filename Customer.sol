pragma solidity ^0.8.0;

contract Argument{

}

contract Payment{
    struct C_info {
        string Fname;
        string Lname;
        string location;
        uint payments;
    }
    mapping(uint=>C_info) public Customers;
    function StoreFirstName(string F) public {//Store First Name
       Customers[index].Fname = F;//Error? Undeclared Identifier
    }
    function UpdatePayments(uint C) public {
        
    }
}

contract Power{

}
