package com.cg.bs.dao;

import java.sql.SQLException;
import java.util.List;

import com.cg.bs.entity.Message;
import com.cg.bs.entity.Proposal;
import com.cg.bs.entity.Query;
import com.cg.bs.entity.User;

public interface AbcpDAO {
	List<User> validateLogin(String username, String password)
			throws SQLException;

	Proposal uploadFile(Proposal proposalFile) throws SQLException;

	Proposal getFile(int i);

	void askQuery(Query message) throws SQLException;

	void replyQuery(int queryId, String reply) throws SQLException;

	List<Proposal> getProposals(String teamName) throws SQLException;

	List<Query> getQueries(String teamName) throws SQLException;

	List<Query> findSameQuery(Query message) throws SQLException;

	List<Message> getMessages(String teamName) throws SQLException;

}
