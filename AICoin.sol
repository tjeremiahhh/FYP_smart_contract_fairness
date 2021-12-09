//AICoin

function vote(uint32 _ballotId, uint32 _selectedOptionId) {

    /* verify that the ballot exists */
    require(_ballotId > 0 && _ballotId <= numBallots);

    /* Ballot must be in progress in order to vote */
    require(isBallotInProgress(_ballotId));

    /* Calculate the balance which which the coin holder has not yet voted, which is the difference between
     * the current balance for the senders address and the amount they already voted in this ballot.
     * If the difference is zero, this attempt to vote will fail.
     */
    uint256 votableBalance = balanceOf(msg.sender) - ballotVoters[_ballotId][msg.sender];
    require(votableBalance > 0);

    /* validate the ballot option */
    require(_selectedOptionId > 0 && _selectedOptionId <= ballotDetails[_ballotId].numOptions);

    /* update the vote count and record the voter */
    ballotVoteCount[_ballotId][_selectedOptionId] += votableBalance;
    ballotVoters[_ballotId][msg.sender] += votableBalance;
  }