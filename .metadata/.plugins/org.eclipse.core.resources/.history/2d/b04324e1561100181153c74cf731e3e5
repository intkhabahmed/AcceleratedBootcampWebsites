package com.cg.bf.service;

import java.util.List;

import com.cg.bf.entity.Message;
import com.cg.bf.entity.Proposal;
import com.cg.bf.entity.Query;
import com.cg.bf.entity.User;
import com.cg.bf.exceptions.ServiceDownException;
import com.cg.bf.exceptions.UserNotFoundException;

public interface AbcServices {
	User ValidateLogin(String username, String password)
			throws ServiceDownException, UserNotFoundException;

	int uploadFile(Proposal proposalFile) throws ServiceDownException;

	Proposal getFile(int i);

	void askQuery(Query message) throws ServiceDownException;

	void replyQuery(int queryId, String reply) throws ServiceDownException;

	List<Proposal> getProposals() throws ServiceDownException;

	List<Query> getQueries() throws ServiceDownException;

	Proposal getProposal(String teamName) throws ServiceDownException;

	void updateProposal(Proposal proposalFile) throws ServiceDownException;

	void sendMessage(Message message) throws ServiceDownException;

	List<Message> getMessages() throws ServiceDownException;

	void deleteQuery(int queryId) throws ServiceDownException;

}
