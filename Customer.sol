// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Customer{

	address private customer;
	string public Complaint
	string private Fname;
	string private Lname;
	uint private money;
	
	constructor() public {
	
	}
	function MakePayment() returns(uint m){
		return m;
	}
	function WriteComplaint(string M)public view returns (string message){
		Complaint=M;
		return M;
	}
	

}
