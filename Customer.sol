pragma solidity ^0.8.0;

contract Payment{
    struct C_info {
        mapping (uint=> address) public balances
        string Fname;
        string Lname;
        string location;
        address payable department;
    }
    C_info public customers;
    function StoreFirstName(string memory F) public {
    	customers.Fname = F;   
    }
    function StoreLastName(string memory L) public {
        customers.Lname=L;
    }
    function StoreLocation(string memory A) public {
        customers.location=A;
    }
    function getFirstName() public view returns (string memory){
        return customers.Fname;
    }
    function getLastName() public view returns (string memory){
        return customers.Lname;
    }
    function getLocation() public view returns (string memory){
        return customers.location;
    }
    function UpdatePayments(uint C) public {

    }
}
contract argument{

}

contract Power{

}
