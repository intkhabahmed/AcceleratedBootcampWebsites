package com.cg.up.service;

import java.io.IOException;
import java.util.List;

import com.cg.up.entity.Message;
import com.cg.up.entity.Proposal;
import com.cg.up.entity.Query;
import com.cg.up.entity.User;
import com.cg.up.exceptions.ServiceDownException;
import com.cg.up.exceptions.UserNotFoundException;

public interface AbcpServices {
	User ValidateLogin(String username, String password)
			throws ServiceDownException, UserNotFoundException;

	int uploadFile(Proposal proposalFile) throws ServiceDownException,
			IOException;

	Proposal getFile(int i);

	void askQuery(Query message) throws ServiceDownException;

	void replyQuery(int queryId, String reply) throws ServiceDownException;

	List<Proposal> getProposals(String teamName) throws ServiceDownException;

	List<Query> getQueries(String teamName) throws ServiceDownException;

	Boolean findSameQuery(Query message) throws ServiceDownException;

	List<Message> getMessages(String teamName) throws ServiceDownException;

	void updateProposal(Proposal proposalFile) throws ServiceDownException;

	Proposal getProposal(String teamName) throws ServiceDownException;

	void deleteQuery(int queryId) throws ServiceDownException;

}
