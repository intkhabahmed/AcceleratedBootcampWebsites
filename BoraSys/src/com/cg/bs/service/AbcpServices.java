package com.cg.bs.service;

import java.io.IOException;
import java.util.List;

import com.cg.bs.entity.Message;
import com.cg.bs.entity.Proposal;
import com.cg.bs.entity.Query;
import com.cg.bs.entity.User;
import com.cg.bs.exceptions.ServiceDownException;
import com.cg.bs.exceptions.UserNotFoundException;

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

}
