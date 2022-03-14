// Ballot.sol
contract _MAIN_{
    Ballot voterContract;
    constructor () public {
        voterContract = new Ballot();

        bytes32[] memory proposalNames;
        proposalNames = new bytes32[];
        proposalNames[0] = "A";
        proposalNames[1] = "B";
        proposalNames[2] = "C";

        voterContract.Ballot(proposalNames);
        
        uint[] memory weights;
        weights = new uint[];
        weights[0] = 1;
        weight[1] = 1;

        bytes32[] memory voterNames;
        voterNames = new bytes32[];
        voterNames[0] = "Harry";
        voterNames[1] = "Tom";

        uint[] memory proposalIds;
        proposalIds = new uint[];
        proposalIds[0] = 1;
        proposalIds[1] = 2;

        voterContract.vote(weights, voterNames, proposalIds);

        uint winner = voterContract.winningProposal();

        bytes32[] memory newProposalNames;
        newProposalNames = new bytes32[];
        newProposalNames[0] = "D";
        newProposalNames[1] = "E";
        newProposalNames[2] = "F";

        voterContract.resetBallot(newProposalNames);
    }
}

//DemaxBallotFactory.sol
contract _MAIN_{
    DemaxBallotFactory voterContract;
    constructor () public {
        voterContract = new DemaxBallotFactory();
        
    }
}

//ibaVoter.sol
contract _MAIN_ {
    ibaVoter voterContract;
    address addr;
    constructor () public {
        voterContract = new ibaVoter();
        addr = address(voterContract);
        assert(addr == address(voterContract));
        bytes32 ballotName = "BallotTest";
        bool blindParam = false;

        bytes32[] memory proposalNames;
        proposalNames = new bytes32[](4);
        proposalNames[0] =  "A";
        proposalNames[1] =  "B";
        proposalNames[2] =  "C";

        voterContract.startNewBallot(ballotName, blindParam, proposalNames);

        voterContract.vote(msg.sender, 0, 1);

        voterContract.finishBallot(ballotName);
        voterContract.getWinner(msg.sender, 0);
    }
}

//localElection.sol
contract _MAIN_ {
    localElection voterContract;
    constructor () public {
        voterConstract = new localElection();

        voterContract.startElection();

        string memory council;
        string memory singleVote;

        string memory name = "name";
        string memory HKID = "HKID";
        string memory email = "email";

        uint256 voterID = voterContract.getVoterID(name, HKID);
        string memory emailHash = voterContract.getEmailHash(email);
        voterContract.register(voterID, emailHash, council);
        voterContract.submitVote(voterID, emailHash, council, singleVote);

        voterContract.stopElection();
        voterContract.getResult(council);
    }
}

//Redenom.sol
contract _MAIN_ {
    Redenom voterContract;
    constructor () public {
        voterConstract = new Redenom();

        uint currentBallotId = voterContract.enableVoting();

        voterContract.addProject(0);
        voterContract.addProject(1);
        voterContract.addProject(2);
 
        voterContract.vote(0);

        voterContract.disableVoting();

    }
}

//TACVoting.sol
contract _MAIN_ {
    TACVoting voterContract;
    constructor () public {
        voterContract = new TACVoting();

        voterContract.openElection();

        uint64 matchId = 0;
        uint64 electionId = 0;
        string memory videoURL = "video url";
        string memory description = "match description";
        address bluePlayer = address(voterContract);

        voterContract.joinElection(electionId, matchId, videoURL, description, bluePlayer);

        voterContract.vote(0,0);

        voterContract.closeElection(0);

    }
}

//TomiQuery2.sol
contract _MAIN_ {
    TomiBallot voterContract;
    constructor () public {
        voterContract = new TomiBallot();

        address voterAddress = address(voterContract);

        voterContract.voteByGovernor(voterAddress, 1);

        voterContract.end();
        voterContract.winningProposal();
        
    }
}

//WeightedVoteCheckpoint.sol
contract _MAIN_ {
    WeightedVoteCheckpoint voterContract;
    constructor () public {
        voterContract = new WeightedVoteCheckpoint();

        uint256 duration = 604800;
        uint256 noOfProposals = 3;
        uint256 quoromPercentage = 50;

        voterContract.createBallot(duration, noOfProposals, quoromPercentage);

        voterContract.castVote(0, 1);

        voterContract.getBallotResults(0);
    }
}

