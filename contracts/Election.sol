pragma solidity ^0.4.24;
import "./SafeMath.sol";

contract Election {
	using SafeMath for uint256;
	// Model a Candidate
	
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

// setup  to listen for events
	event votedEvent (
		uint indexed _candidateId
	);

	// Store accounts that have voted
	mapping(address => bool) public voters;


	// Store Candidates
	// Fetch Candidates
	mapping(uint => Candidate) public candidates;
	

	uint public candidatesCount;
	// Store Candidates Count

	constructor () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
		addCandidate("Candidate 3");
	}


	function addCandidate (string _name) private {
		candidatesCount = candidatesCount.add(1);
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); 
	}

	function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        emit votedEvent(_candidateId);

	}

}