pragma solidity ^0.5.16;

//Project agreed solidity version
/*
This script will allow the power providers andcustomers to make an agreement and provide power to customers
*/


contract Power{
    string fristName; // Name of customer
    string lastName;
    address customer; // Customer identification 
    string providerName; // Name of power provider
    uint providerID; // Provider Identification number 
    bool agreement; // Agreement between power provider and customer under conditions
   // bool pmagreement; // Agreement between power provided and maintence agency under payment conditions

    struct customer(
        string providerName,
        uint provider
    )
    }
