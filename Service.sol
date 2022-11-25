pragma solidity ^0.5.16;
//Project agreed solidity version
/*
This script will allow the providers to make an agreement to
service the tenant/Owner of the house hold
*/

//Created a parent contract called provider because the providers share the following attribute: CompanyName, ProviderID, ProviderTeam, and their tenants
contract Provider{
    string providerName;//provider company name Ex: Electic co, FTC, Southern Maryland Electric Company, etc.
    uint internal providerID; //Provider id for information for the reciept
    address internal provider; //Provider password
    address internal currentTenant; // address for the tenant the provider will interact with
    bool agreement;
    constructor (string memory provider_name, uint provider_ID, address providerA, address Cur_tenant) public {//When provider is created set attributes of the provider in the system
        providerName=provider_name;
        providerID=provider_ID;
        provider=providerA;
        currentTenant=Cur_tenant;
    }
    modifier not_Provider(){
        require(msg.sender!=provider, "Only tenants can access this");
        _;
    }

    modifier only_Provider(){
        string memory message= string(abi.encodePacked("Only the ",providerName," can access this"));
        require(msg.sender==provider, message);
        _;
    }
}

contract Power_providers is Provider{ //People who provide power
    //Defining the constructor for power provider
    constructor(string memory provider_name, uint provider_ID, address providerAddress, address Current_tenant) Provider(provider_name,provider_ID,providerAddress, Current_tenant) public {

    }
}

contract Maintenance_provider is Provider{
    //Defining the constructor for maintenance provider
    constructor(string memory provider_name, uint provider_ID, address providerAddress, address Current_tenant) Provider(provider_name,provider_ID,providerAddress, Current_tenant) public {

    }
}
contract Government_People is Provider{
    //Defining the constructor for Agency provider
    constructor(string memory provider_name, uint provider_ID, address providerAddress, address Current_tenant) Provider(provider_name,provider_ID,providerAddress, Current_tenant) public {

    }
}

contract ServicemManagement{

	function Make_service_agreement()public{
	
	}

	function Complete_service_agreement()public{

	}
}
