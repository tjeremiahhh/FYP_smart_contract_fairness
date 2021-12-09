//ibaVoter

function vote(address chainperson, uint256 ballot, uint256 proposalNum) external returns (bool success){
        
        if (ballots[chainperson][ballot].finished == true){
            revert();
        }
        for (uint8 i = 0;i<voted[chainperson][ballot].length;i++){
            if (votedDatas[chainperson][ballot][msg.sender].isVal == true){
                revert();
            }
        }
        voted[chainperson][ballot].push(msg.sender);
        voteCount[chainperson][ballot][proposalNum]++;
        votedDatas[chainperson][ballot][msg.sender] = votedData({proposal: proposalNum, isVal: true});
        Vote(msg.sender, proposalNum);
        return true;
    }

function getWinner(address chainperson, uint ballotIndex) public constant returns (bytes32 winnerName){
            if (ballots[chainperson][ballotIndex].finished == false){
                revert();
            }
            uint256 maxVotes;
            bytes32 winner;
            for (uint8 i=0;i<proposals[chainperson][ballotIndex].length;i++){
                if (voteCount[chainperson][ballotIndex][i]>maxVotes){
                    maxVotes = voteCount[chainperson][ballotIndex][i];
                    winner = proposals[chainperson][ballotIndex][i].name;
                }
            }
            return winner;
    }