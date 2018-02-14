package com.cg.qh.dao;

import java.sql.SQLException;
import java.util.List;

import com.cg.qh.entity.Message;
import com.cg.qh.entity.Proposal;
import com.cg.qh.entity.Query;
import com.cg.qh.entity.User;

public interface AbcDAO {
	List<User> validateLogin(String username, String password)
			throws SQLException;

	Proposal uploadFile(Proposal proposalFile) throws SQLException;

	Proposal getFile(int i);

	void askQuery(Query message) throws SQLException;

	void replyQuery(int queryId, String reply) throws SQLException;

	List<Proposal> getProposals() throws SQLException;

	List<Query> getQueries() throws SQLException;

	List<Proposal> getProposal(String teamName) throws SQLException;

	void updateProposal(Proposal proposalFile) throws SQLException;

	void sendMessage(Message message) throws SQLException;

	List<Message> getMessages() throws SQLException;

	void deleteQuery(int queryId) throws SQLException;

	void deleteMessage(int messageId) throws SQLException;

}
