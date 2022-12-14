pragma solidity 0.5.16;

contract Complaints {
   
    uint complaintindex = 0;                // Indexs of the complaints
    uint public no_of_complaints;           // Counts the number of complaints made
    address  _government_agency;            // Stores the address of the goverment agency
    
   struct complaint{                        // The sturcture of the complaint array
    string compl;                           // The actually complaint itself
    string judge;                           // The written judgement of the complaints
    bool been_judged;                       // A boolean indicating weather a complaint has been judged
    uint time_of_complaint;                 // Records when the complaint was made
    uint time_of_judgement;                 // Records when the judgement was made
    address complainer;                     // Stores the address of the complaint maker
    address  _government_agency;            // Stores the address of the judge
   } 

    mapping (uint => complaint) public complaints_by_number;  // Creates an array of complaints

    modifier only_government_agency(){       // Makes sure only a goverment agency can use a function
        require(msg.sender == _government_agency, "You aren't authorize");
        require (complaints_by_number[complaintindex].been_judged == false , "Already been judge") ;
       _; 
    }

    function AssignGovernment() public {      // Register a user as a goverment agency
        _government_agency = msg.sender;
    }


    function make_ComplaintsByPassing(string memory message) public {       
        // Creates a complaint and stores it on the complaint array along with the time of the complaint and the address of the complainer
        // Message essentaily a call in that allows the users to write a string into the function in the compl string
        complaintindex++;
        no_of_complaints++;
        complaints_by_number[complaintindex] = complaint (message,"none",false,now,0,msg.sender,address(0));
    }

      function make_JudgementByPassing(string memory message) public only_government_agency  {   
          // Adds a judgement to a complaint array along with the time of the judgment a true value to the been judged boolean and the address of the judge.
          // Message essentaily a call in that allows the users to write a string into the function in the judge string
          // Applies the modifier only_government_agency which prevents address not registered as a goverment agency from using this function
        require(complaintindex>0);
        complaints_by_number[index].been_judged = true;
        complaints_by_number[index].time_of_judgement = now;
        complaints_by_number[index].judge = message;
        complaints_by_number[index]._government_agency = msg.sender;
    }
    

}
