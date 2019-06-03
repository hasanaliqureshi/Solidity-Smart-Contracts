 pragma solidity ^0.4.17;

contract CampaignFactory {
    address[] public deployedCampaigns;
    
    function createCampaign(uint minimum) public {
        address newCampaign = new Campaign(minimum, msg.sender);
        deployedCampaigns.push(newCampaign);
    }
    
    function getDeployedCampaings() public view returns (address[]) {
        return deployedCampaigns;
    }
    
}

contract Campaign {
    
    struct Request{
        string description;
        uint value;
        address recipent;
        bool complete;
        uint approvalCount;
        mapping(address=>bool) approvals;
    }
    
    modifier restricted(){
        require(msg.sender == manager);
        _;
    }
    
    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    mapping( address => bool) public approvers;
    uint public approversCount;
    
    function Campaign(uint minimum, address creator) public {
        manager = creator;
        minimumContribution = minimum;
    }
    
    function contribute() public payable{
        require(msg.value > minimumContribution);
        approvers[msg.sender] = true;
        approversCount++;
    }
    
    function createRequest(string description, uint value, address recipent) public restricted{
        Request memory newRequest = Request({
           description : description,
           value : value,
           recipent : recipent,
           complete : false,
           approvalCount : 0
        });
        
        requests.push(newRequest);
    }
    
    function approveRequest(uint index) public {
        Request storage request = requests[index];
    
        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);
        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }
    
    function finalizeRequest(uint index) public restricted {
        Request storage request = requests[index];
        require(request.approvalCount > (approversCount / 2));
        require(!request.complete);
        request.recipent.transfer(request.value);
        request.complete = true;
        
    }

}
