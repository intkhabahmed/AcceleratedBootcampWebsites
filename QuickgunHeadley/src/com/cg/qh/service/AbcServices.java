package com.cg.qh.service;

import java.util.List;

import com.cg.qh.entity.Message;
import com.cg.qh.entity.Proposal;
import com.cg.qh.entity.Query;
import com.cg.qh.entity.User;
import com.cg.qh.exceptions.ServiceDownException;
import com.cg.qh.exceptions.UserNotFoundException;

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

	void deleteMessage(int messageId) throws ServiceDownException;

}
