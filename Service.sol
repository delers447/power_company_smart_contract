pragma solidity ^0.5.16;
//Project agreed solidity version
/*
This script will allow the providers to make an agreement to
service the tenant/Owner of the house hold
*/

//Created a parent contract called provider because the providers share the following attribute: CompanyName, ProviderID, ProviderTeam, and their tenants
//Both Provider amd it's children are still under development until a new set of instructions are made.
/*
Igonore this commit for now 
contract Provider{
    string providerName;//provider company name Ex: Electic co, FTC, Southern Maryland Electric Company, etc.
    uint internal providerID; //Provider id for information for the reciept
    address internal provider; //Provider hash key
    bool agreement;//Provider agreement under condition
    constructor (string memory provider_name, uint provider_ID, address providerA) public {//When provider is created set attributes of the provider in the system
        providerName=provider_name;
        providerID=provider_ID;
        provider=providerA;
    }
    modifier not_Provider(){//This is a modifier for only the tenants having access to functionalities of a contract
        require(msg.sender!=provider, "Only tenants can access this");
        _;
    }

    modifier only_Provider(){//This modifier for only having the provider to access functionalities of a contract
        string memory message= string(abi.encodePacked("Only the ",providerName," can access this"));
        require(msg.sender==provider, message);
        _;
    }
    function agreed() public {
        agreement=true;
    }
    
}

contract Power_providers is Provider{ //Company who provide power
    //Defining the constructor for power provider
    constructor(string memory provider_name, uint provider_ID, address providerAddress) Provider(provider_name,provider_ID,providerAddress) public {

    }
   
}

contract Maintenance_provider is Provider{//Company who provides maintanence
    //Defining the constructor for maintenance provider
    constructor(string memory provider_name, uint provider_ID, address providerAddress) Provider(provider_name,provider_ID,providerAddress) public {}

}
contract Government_People is Provider{//Company who provide authority to the company to check if this course of action is legal or not
    //Defining the constructor for Agency provider
    constructor(string memory provider_name, uint provider_ID, address provider_Address) Provider(provider_name,provider_ID,provider_Address) public {}


}
*/
/*
This contract is the main contract for service.sol
Provider will enter an agreement message and index,
client (recipiant) will see the message and either agree or disagree with the provider
if the client agrees the transaction will execute
*/
contract ServicemManagement{
    uint Serviceindex=0;//set service index to 0 in order to put more service information for later
    uint public no_of_receipts;// same rule applies for no_of_recipts

    struct Receipt{ //gathering information regarding reciept information for transactions from the client
        uint receiptid;
        string reason_for_payment;
        uint amount_paid;
        uint timestamp;
        address payable client;
        address payable provider;

    }
    struct Serviceinfo{// information for what type of service and how much the service will cost
        uint timestamp;
        uint providersCost;
        string agreementmessage;
        bool recipiantAgreement;
        address payable recipiant;
        address payable provider;
    }
    
    mapping(uint => Receipt) public receipt_by_number;//create an array for reciepts
    mapping(uint=>Serviceinfo) public List_of_Service_agreement;//create an array for service information 

    function Make_service_agreement(uint index, string memory agreementmessage, uint cost)public {//This function 
        List_of_Service_agreement[index].agreementmessage=agreementmessage;//Store agreement management in service information when called
        List_of_Service_agreement[index].timestamp=now;//Get current time when Make service agreement when called
        List_of_Service_agreement[index].provider=msg.sender; // provider will be the msg.sender when sending this agreement to the blockchain
        List_of_Service_agreement[index].providersCost = cost;//enter in how much it would cost for the service
    }

    function Get_recipiant_agreement(uint index, bool agreement) public { //this function will allow the client to type true or false
        List_of_Service_agreement[index].recipiantAgreement=agreement;
    }
    
    function make_receipt(address payable client, address payable provider, string memory reason, uint amount_to_be_paid) private{//This function generate the reciept from the given agreement
        require(provider != address(0));
        require(client != address(0));
        no_of_receipts++;
        provider.transfer(amount_to_be_paid);
        receipt_by_number[no_of_receipts] = Receipt(no_of_receipts, reason, amount_to_be_paid, now, client, provider);
    }
	function Complete_service_agreement(uint index)public payable//if recipient says true, make the transfers and reciepts
    {
        require(List_of_Service_agreement[index].recipiantAgreement==true);
        //address payable Recipiant = List_of_Service_agreement[index].recipiant;
        make_receipt(List_of_Service_agreement[index].recipiant,List_of_Service_agreement[index].provider, List_of_Service_agreement[index].agreementmessage, List_of_Service_agreement[index].providersCost);
        
       
	}
}

