pragma solidity ^0.5.16;

contract Payments{
    uint public no_of_receipts;

    struct Receipt{
        uint receiptid;
        string reason_for_payment;
        uint amount_paid;
        uint timestamp;
        address payable who_paid;
        address payable who_to_be_paid;

    }
    mapping(unit => Receipt) public receipt_by_number;

    function make_receipt(address who_paid, address who_to_be_paid, string reason, unit amount) private payable{
        require(payee != address(0));
        require(payer != address(0));
        no_of_receipts++;
        who_to_be_paid.transfer(amount)
        receipt_by_number[no_of_receipts] = Receipt(no_of_receipts, reason, amount, now, payee, payer)
    }

}