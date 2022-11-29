pragma solidity ^0.5.16;
//Project agreed solidity version
/*
This script will allow the providers to make an agreement to
service the tenant/Owner of the house hold
*/

//Created a parent contract called provider because the providers share the following attribute: CompanyName, ProviderID, ProviderTeam, and their tenants
//Both Provider amd it's children are still under development until a new set of instructions are made.
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
    
    modifier Only_Government_access(){//For functions that only can be run for government people only
        require(msg.sender == provider,"Only government official can have access to this");
        _;
    }

}
contract ServicemManagement{//This contract is the main contract where the agreement will take place
	struct Tenant{ //The tenant or owner of the house hold
        address payable Tenantaddress;//Payments from the tenant for the service
        string HousingAddress;// Housing Location
        uint Wattage; //Wattage that have been used up this month 
        uint timestamp;//Timestamped on when agreement have been requested
        bool agreement;//Tenant agreement on providers charges on service.
    }
    Tenant Consumer; //Initalize the tenant
    modifier Tenant_Only(){//A tenant only modifier for any functions that require only the tenant usage
        require(msg.sender==Consumer.Tenantaddress);
        _;
    }
    string PowerCompanyName;// Names for Power company, Maintanece company, and government department
    string MaintanenceCompanyName;
    string GovernmentDepartmentName;
    uint PowerCompanyID; // ID for Power company, Maintanece company, and government department
    uint MaintanenceCompanyID;
    uint GovernmentDepartmentID;
    address PowerCompanyAddress;// addresses for Power company, Maintanece company, and government department
    address MaintanenceCompanyAddress;
    address GovernmentDepartmentAddress;

    Power_providers PowerCompany = new Power_providers(PowerCompanyName,PowerCompanyID,PowerCompanyAddress);//initalize Power company contract
    Maintenance_provider MaintanenceCompany = new Maintenance_provider(MaintanenceCompanyName,MaintanenceCompanyID,MaintanenceCompanyAddress);//initalize Maintanence Company contract
    Government_People GovernmentDepartment = new Government_People(GovernmentDepartmentName,GovernmentDepartmentID,GovernmentDepartmentAddress); //initalize Government department contract
	
    function Make_service_agreement()public {//All parties (Tenant, PowerCompany, MaintanenceCompany, and Government) must agree on the following conditions
        //Power company = Gives out agreement on tenant to payment this criteria by giving out this much wattage
        //Maintanence company =Gives out agreement on Power company on the service based on the power company agreement
        //Government department seems agreement on both power and maintanence company and check if this activity is legal
        //Tenant either agree or disagree with this agreement from the previous agreements.
	}

	function Complete_service_agreement()public payable Tenant_Only(){//If all parties agree with the service agreement then Tenant will complete the transaction by transfer kc

	}
}
