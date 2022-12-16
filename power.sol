pragma solidity ^0.5.16;

//Project agreed solidity version
/*
This script will allow the power providers andcustomers to make an agreement and provide power to customers
*/

contract Power{
    uint public no_of_agreements = 0; // Number of agreements made between customers and providers
    uint public no_of_providers = 0;
    uint public no_of_receipts;
    
    struct Providers{
        uint providerid; // Provider identification number
        string providerbrand; // Provider brand name 
        string providerAddress; // provider location
        uint monthlyPayment; 
        uint securitydeposit;
        uint timestamp;
        address payable powerProvider; // Payment recieved by power provider
    }
    mapping(uint => Providers) public Providers_by_No;

    struct PowerAgreement{
        uint agreementid;
        bool currently_active;  
        string customerName; 
        string customerAddress;
        uint providerid;
        uint monthlyPayment;
        uint securitydeposit;
        uint timestamp;
        address payable currentCustomer; // Payment sent from custome's account
        address payable powerProvider; // Payment recieved by power provider
    }
    mapping(uint => PowerAgreement) public PowerAgreement_by_No;

   struct Receipt{
        uint receiptid;
        string reason_for_payment;
        uint monthlyPayment;
        uint timestamp;
        address payable currentCustomer;
        address payable powerProvider;
    }
    mapping(uint => Receipt) public receipt_by_number;

    function register_as_power_supplier(string memory name, string memory street_address, uint payment, uint deposit) public {
        no_of_providers++;
        Providers_by_No[no_of_providers] = Providers(no_of_providers, name, street_address, payment, deposit, now, msg.sender);
    }

    function make_receipt(address payable currentCustomer, address payable powerProvider, string memory reason, uint monthlyPayment) 
        private  {
            require(powerProvider != address(0));
            require(currentCustomer != address(0));
            no_of_receipts++;
            powerProvider.transfer(monthlyPayment);
            receipt_by_number[no_of_receipts] = Receipt(no_of_receipts, reason,monthlyPayment,now,currentCustomer,powerProvider);
        }

    function power_agreement(string memory name, string memory street_address) public payable{
        require(no_of_providers > 0, "There are no providers availible.");
        no_of_agreements++;
        uint monthly_payment = Providers_by_No[1].monthlyPayment;
        uint deposit = Providers_by_No[1].securitydeposit;
        address payable provider_address = Providers_by_No[1].powerProvider;
        PowerAgreement_by_No[no_of_agreements] = PowerAgreement(no_of_agreements, true, name, street_address, 1, monthly_payment, deposit, now, msg.sender, provider_address);
        //make_receipt(msg.sender, provider_address, "Secuirity Depsoit for Power Agreement.", deposit);
        no_of_receipts++;
        receipt_by_number[no_of_receipts] = Receipt(no_of_receipts, "Secuirity Depsoit for Power Agreement.",deposit,now,msg.sender, provider_address);
        provider_address.transfer(deposit);
    }

    function pay_for_power(uint _index) public payable{
        require (PowerAgreement_by_No[_index].currently_active, "Agreement is not currently active.");
        //make_receipt(msg.sender, PowerAgreement_by_No[_index].powerProvider, "Monthly Payment", PowerAgreement_by_No[_index].monthlyPayment);
        no_of_receipts++;
        receipt_by_number[no_of_receipts] = Receipt(no_of_receipts, "Monthly Payment",PowerAgreement_by_No[_index].monthlyPayment,now,msg.sender, PowerAgreement_by_No[_index].powerProvider);
        PowerAgreement_by_No[_index].powerProvider.transfer(PowerAgreement_by_No[_index].monthlyPayment);

    }
    function terminate(uint _index) public {
        require (PowerAgreement_by_No[_index].currently_active, "Agreement is not currently active.");
        PowerAgreement_by_No[_index].currently_active = false;
    }

}
