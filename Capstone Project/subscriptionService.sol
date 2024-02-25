// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Problem Statement 2: Subscription Service

// Objective: Build a Subscription Service contract that offers a subscription-based model 
//for users to access a service or content. Users pay a subscription fee in Ether for a fixed period of access.

// Define a subscription fee and duration.
// Allow users to subscribe by paying the subscription fee.
// Users can unsubscribe at any time before their subscription ends.
// Include a function to check whether a user's subscription is currently active.

// User koi bhi ho sakta hai, and service are predefined by owner before deploying the contract
//I could make it more complex and intersing like tuseet sir, lakin time nahi hai, so I am keeping it simple(lakin fir bhi complex hai, samajhne wale samajh gaye honge)

contract subscriptionService{
       
        //User ki details
        struct User{
            address uskaAddress;//User ka address
            uint256 startTime;//Subscription start time
            string course;//User ko konsa course chahiye
            bool subscriptionKaStatus;//User ka subscription status
            uint256 durationRemaing;//Remaining duration of the subscription
        }

        //Predefined imagine karo ki koi bhi random service available hai
        struct LMSService{
            string serviceKaNaam;//Service naam
            uint256 serviceKiFee;//Service ki fee in wei(per month)
            string serviceKiDetails;//Service ki details
            uint duration;//Service ki duration in hours
        }

        //List of LMS service
        LMSService[] public lmsService;
        
        //User ki list
        User[] private users;
        address owner;

        //Random koi bhi service for testing
        constructor(){
            owner=msg.sender;//Owner of the contract(i am taking kuki servie yehi provide kar raha hai, toh paisa owner ko hi toh jayega, so owner ka address store kar raha hu, taki paisa owner kai mu pai maru )
            //random services of lms
            lmsService.push(LMSService("Web Development", 76980998898, "Most easy but boring ", 300));//Service name, fee(it in wei or ether mai then divide it by 1000000000000000000 to convert it into ether), details, duration in hours
            lmsService.push(LMSService("App Development",7858759709809809, "Learn app development ", 300));
            lmsService.push(LMSService("Block Chain", 987986876567465, "Good, course nahi teachers ",400));
            lmsService.push(LMSService("Machine Learning", 987764653453, "ML ko maro goli ", 120));
            lmsService.push(LMSService("Artificial Intelligence", 96875764653543, "AI for human distruction ", 100));

            //random users for testing and address
            users.push(User(msg.sender, block.timestamp, "Web Development", true, 300*3600));//Mul by 3600 to convert hours into seconds
            users.push(User(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, block.timestamp, "App Development", true, 300*3600));
            users.push(User(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, block.timestamp, "Block Chain", true, 400*3600));
            users.push(User(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, block.timestamp, "Machine Learning", true, 120*3600));
            users.push(User(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, block.timestamp, "Artificial Intelligence", true, 100*3600));
        }

    //Listing all the services but only name and fee and index
    function displayAllServices() public view returns(string[] memory serviceName, uint256[] memory serviceFee, uint[] memory indexo){
        //memory array is used by apun to store value for displaying
        string[] memory name = new string[](lmsService.length);
        uint256[] memory fee = new uint256[](lmsService.length);
        uint[] memory index = new uint[](lmsService.length);

        //Simple traverse karo and check karo ki product sold hai ya nahi
        for(uint i = 0; i < lmsService.length; i++){
            name[i] = lmsService[i].serviceKaNaam;//Service name
            fee[i] = lmsService[i].serviceKiFee;//Service fee
            index[i] = i;
        }
        return (name, fee, index);
    }

        //Dercrese the duration of the user subscription, if the user is subscribed
        //I wanted to automate the process of decreasing the duration of the user subscription after some interval of time
        //But mere pass time kaam tha or iska logic bhi nahi aaya, so I am not able to implement this function automatically
        //So, I am calling this function manually after some interval of time (may call by owner) 
        //I can call this fun in every other callable function, but I am not doing this because it will increase the gas cost(apun ko gas nahi waste karna hai)
        function decreaseDuration() public{
            for(uint256 i = 0; i < users.length; i++){
                //sab ko nahi check karna, only subscribed user ko check karna hai
                if(users[i].subscriptionKaStatus == true){
                    users[i].durationRemaing = users[i].durationRemaing - (block.timestamp - users[i].startTime);//Decrease the duration, simple login hai
                    if(users[i].durationRemaing <= 0){
                        users[i].subscriptionKaStatus = false;//If duration is over, then unsubscribe the user
                    }
                }
            }
        }


        //LMS service user ko sub karna
        function subscribe(uint256 _indexo) public payable{
            //User ko service sub karna hai, so user ko service ki fee deni hogi
            require(msg.value == lmsService[_indexo].serviceKiFee, "Bro/Sis, you are not sending correct value of my service. Please send the correct value.");
            payable(address(owner)).transfer(msg.value);//Owner ko paisa
            uint256 duration = lmsService[_indexo].duration;//Service ki duration
            users.push(User(msg.sender, block.timestamp, lmsService[_indexo].serviceKaNaam, true, duration*3600));
        }

        
        //User ki details check karna
        function checkUserDetails(address _address) public view returns(string memory course, bool status, uint256 duration){
            for(uint256 i = 0; i < users.length; i++){
                //User ki details check karna hai ki user hai ya nahi
                if(users[i].uskaAddress == _address){
                    return (users[i].course, users[i].subscriptionKaStatus, users[i].durationRemaing);//User ki details
                }
            }
            return ("User tu hai kai nahi", false, 0);//User nahi hai
        }
    


        
        //User ka subscription status check karna
        function checkSubscriptionStatus(address _address) public view returns(bool status, uint256 duration){
            for(uint256 i = 0; i < users.length; i++){
                //User ki details check karna hai ki user hai ya nahi
                if(users[i].uskaAddress == _address){
                    return (users[i].subscriptionKaStatus, users[i].durationRemaing);//User ki details
                }
            }
            return (false, 0);
        }

        //User ko unsubscribe karna
        function unsubscribe() public{
            for(uint256 i = 0; i < users.length; i++){
                if(users[i].uskaAddress == msg.sender){
                    users[i].subscriptionKaStatus = false;//    Unsubscribe the user
                }
            }
        }



}