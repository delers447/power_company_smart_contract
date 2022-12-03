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
    mapping(uint => Receipt) public receipt_by_number;

    function make_receipt(address payable who_paid, address payable who_to_be_paid, string memory reason, uint amount_to_be_paid) private {
        require(who_to_be_paid != address(0));
        require(who_paid != address(0));
        no_of_receipts++;
        who_to_be_paid.transfer(amount_to_be_paid);
        receipt_by_number[no_of_receipts] = Receipt(no_of_receipts, reason, amount_to_be_paid, now, who_paid, who_to_be_paid);
    }

}
