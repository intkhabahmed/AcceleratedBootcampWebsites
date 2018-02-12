package com.cg.bc.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cg.bc.dao.AbcpDAO;
import com.cg.bc.entity.Message;
import com.cg.bc.entity.Proposal;
import com.cg.bc.entity.Query;
import com.cg.bc.entity.User;
import com.cg.bc.exceptions.ServiceDownException;
import com.cg.bc.exceptions.UserNotFoundException;

@Service
@Transactional
public class AbcpServicesImpl implements AbcpServices {

	@Autowired
	private AbcpDAO abcpDAO;

	@Override
	public User ValidateLogin(String username, String password)
			throws ServiceDownException, UserNotFoundException {
		List<User> users;
		try {
			users = abcpDAO.validateLogin(username, password);
			if (users.size() == 0) {
				throw new UserNotFoundException(
						"Username or Password is incorrect");
			}

		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailble! Try Again Later");
		}
		return users.get(0);
	}

	@Override
	public int uploadFile(Proposal proposalFile) throws ServiceDownException,
			IOException {
		Proposal returnedProposalFile;
		try {
			returnedProposalFile = abcpDAO.uploadFile(proposalFile);
		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
		return returnedProposalFile.getProposalId();
	}

	@Override
	public Proposal getFile(int id) {
		return abcpDAO.getFile(id);
	}

	@Override
	public void askQuery(Query message) throws ServiceDownException {
		try {
			abcpDAO.askQuery(message);
		} catch (SQLException sqlException) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
	}

	@Override
	public void replyQuery(int queryId, String reply)
			throws ServiceDownException {
		try {
			abcpDAO.replyQuery(queryId, reply);
		} catch (SQLException sqlException) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}

	}

	@Override
	public List<Proposal> getProposals(String teamName)
			throws ServiceDownException {
		try {
			List<Proposal> proposals = abcpDAO.getProposals(teamName);
			if (proposals.size() == 0) {
				return null;
			}
			return proposals;
		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
	}

	@Override
	public List<Query> getQueries(String teamName) throws ServiceDownException {
		try {
			List<Query> queries = abcpDAO.getQueries(teamName);
			if (queries.size() == 0) {
				return null;
			}
			return queries;
		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
	}

	@Override
	public Boolean findSameQuery(Query message) throws ServiceDownException {
		try {
			List<Query> queries = abcpDAO.findSameQuery(message);
			if (queries.size() == 0) {
				return false;
			}
			return true;
		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
	}

	@Override
	public List<Message> getMessages(String teamName)
			throws ServiceDownException {
		try {
			List<Message> messages = abcpDAO.getMessages(teamName);
			if (messages.size() == 0) {
				return null;
			}
			return messages;
		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
	}

	@Override
	public void updateProposal(Proposal proposalFile)
			throws ServiceDownException {
		try {
			abcpDAO.updateProposal(proposalFile);
		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}
	}

	@Override
	public Proposal getProposal(String teamName) throws ServiceDownException {
		List<Proposal> proposals;
		try {
			proposals = abcpDAO.getProposal(teamName);
			if (proposals.size() == 0) {
				return null;
			}

		} catch (SQLException e) {
			throw new ServiceDownException(
					"Service unavailble! Try Again Later");
		}
		return proposals.get(0);
	}

	@Override
	public void deleteQuery(int queryId) throws ServiceDownException {
		try {
			abcpDAO.deleteQuery(queryId);
		} catch (SQLException sqlException) {
			throw new ServiceDownException(
					"Service unavailable right now, Try Again Later!");
		}

	}
}
