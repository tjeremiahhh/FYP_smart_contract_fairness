//TomiQuery2

function voteByGovernor(address user, uint256 proposal) public onlyGovernor {
        Voter storage sender = _giveRightToVote(user);
        require(proposal == YES || proposal == NO, 'Only vote 1 or 2');
        sender.voted = true;
        sender.vote = proposal;
        proposals[proposal] += sender.weight;
        
        if (user != proposer) {
            total += sender.weight;
        }
    }

function winningProposal() public view returns (uint256) {
        if (proposals[YES] > proposals[NO]) {
            return YES;
        } else if (proposals[YES] < proposals[NO]) {
            return NO;
        } else {
            return NONE;
        }
    }