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
    
    function StoreFirstName(string F) public {//Store First Name
    	C_info.Fname=F;   
    }
    function UpdatePayments(uint C) public {
        
    }
}

contract Power{

}
