package com.cg.bf.controller;

import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.cg.bf.entity.Message;
import com.cg.bf.entity.Proposal;
import com.cg.bf.entity.Query;
import com.cg.bf.entity.User;
import com.cg.bf.exceptions.ServiceDownException;
import com.cg.bf.exceptions.UserNotFoundException;
import com.cg.bf.service.AbcServices;

@Controller
@SessionAttributes("user")
public class AbcController {
	@Autowired
	private AbcServices abcServices;

	@RequestMapping("index.html")
	public String showHomePage(Model model) {
		return "index";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model) {
		String returnValue = "redirect:index.html";
		try {
			User user = abcServices.ValidateLogin(username, password);
			if (user.getUsername().equals("quickgunheadley")) {
				throw new UserNotFoundException(
						"Username/Password is incorrect");
			}
			model.addAttribute("user", user);
		} catch (UserNotFoundException userNotFound) {
			model.addAttribute("errorMessage", userNotFound.getMessage());
			returnValue = "index";
		} catch (ServiceDownException serviceDown) {
			model.addAttribute("errorMessage", serviceDown.getMessage());
			returnValue = "error";
		} catch (Exception exception) {
			model.addAttribute("errorMessage", exception.getMessage());
			returnValue = "error";
		}
		return returnValue;
	}

	@RequestMapping(value = "/logout.html")
	public String logout(Model model, SessionStatus status) {
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:index.html";
	}

	@RequestMapping(value = "/uploadFile.html", method = RequestMethod.POST)
	public String uploadProposal(
			@RequestParam("propsalFile") CommonsMultipartFile file,
			HttpSession session, Model model) throws Exception {
		if (null != session.getAttribute("user")) {
			byte[] bytes = file.getBytes();
			Proposal proposal = abcServices.getProposal(((User) session
					.getAttribute("user")).getTeamName());
			Proposal proposalFile = new Proposal();
			if (null == proposal) {
				proposalFile.setTeamName(((User) session.getAttribute("user"))
						.getTeamName());
				proposalFile.setCompanyName("BeneesFradia");
				proposalFile.setFileName(file.getOriginalFilename());
				proposalFile.setProposalDate(Date.valueOf(LocalDate.now()));
				proposalFile.setFile(bytes);
				long fileId = abcServices.uploadFile(proposalFile);
				model.addAttribute("successMessage", "File uploaded with id"
						+ fileId);
			} else {
				proposal.setFile(bytes);
				proposal.setFileName(file.getOriginalFilename());
				proposal.setProposalDate(Date.valueOf(LocalDate.now()));
				abcServices.updateProposal(proposal);
				model.addAttribute("successMessage",
						"Your Proposal File has been updated");
			}

		} else {
			model.addAttribute("errorMessage",
					"You must be logged in to upload proposal");
		}
		return "index";
	}

	@RequestMapping(value = "/downloadProposal.html", method = RequestMethod.GET)
	public String downloadProposal(@RequestParam("proposalId") int proposalId,
			HttpSession session, Model model, HttpServletResponse res)
			throws Exception {
		if (null != session.getAttribute("user")) {
			Proposal proposalFile = abcServices.getFile(proposalId);
			ServletOutputStream sos;
			res.setContentType("application/zip");

			res.setHeader("Content-disposition", "inline; filename="
					+ proposalFile.getFileName());
			sos = res.getOutputStream();
			sos.write(proposalFile.getFile());
			sos.flush();
			sos.close();
		} else {
			model.addAttribute("errorMessage",
					"You must be logged in to upload proposal");
		}
		return "index";
	}

	@RequestMapping(value = "/askQuery.html", method = RequestMethod.POST)
	public String askQuery(@RequestParam("receiver") String receiver,
			@RequestParam("query") String queryData, Model model,
			HttpSession session) {
		String returnValue = "profile";
		Query query = new Query();
		try {
			query.setQuery(queryData);
			query.setReceiver(receiver);
			query.setReply(null);
			query.setSender(((User) session.getAttribute("user")).getTeamName());
			query.setQueryDate(Date.valueOf(LocalDate.now()));
			abcServices.askQuery(query);
			model.addAttribute("successMessage", "Your query has been sent");
			showProfile(model, session);
		} catch (ServiceDownException serviceDown) {
			model.addAttribute("errorMessage", serviceDown.getMessage());
			returnValue = "error";
		}
		return returnValue;
	}

	@RequestMapping(value = "/replyQuery.html", method = RequestMethod.POST)
	public String replyQuery(@RequestParam("queryId") int queryId,
			@RequestParam("reply") String reply, Model model,
			HttpSession session) {
		String returnValue = "profile";
		try {
			abcServices.replyQuery(queryId, reply);
			model.addAttribute("successMessage", "Your reply has been sent");
			showProfile(model, session);
		} catch (ServiceDownException serviceDown) {
			model.addAttribute("errorMessage", serviceDown.getMessage());
			returnValue = "error";
		}
		return returnValue;
	}

	@RequestMapping(value = "/showProfile.html")
	public String showProfile(Model model, HttpSession session) {
		String returnValue = "profile";
		if (null != session.getAttribute("user")) {
			try {
				model.addAttribute("proposals", abcServices.getProposals());
				model.addAttribute("queries", abcServices.getQueries());
				model.addAttribute("messages", abcServices.getMessages());
			} catch (ServiceDownException serviceDown) {
				model.addAttribute("errorMessage", serviceDown.getMessage());
				returnValue = "error";
			}
		} else {
			model.addAttribute("errorMessage", "Please Login to view Profile");
			returnValue = "index";
		}
		return returnValue;
	}

	@RequestMapping(value = "/sendMessage.html", method = RequestMethod.POST)
	public String sendMessage(@RequestParam("teamName") String receiver,
			@RequestParam("message") String messageData, Model model,
			HttpSession session) {
		String returnValue = "index";
		Message message = new Message();
		try {
			message.setMessage(messageData);
			message.setReceiver(receiver);
			message.setSender(((User) session.getAttribute("user"))
					.getTeamName());
			message.setMessageDate(Date.valueOf(LocalDate.now()));
			abcServices.sendMessage(message);
			model.addAttribute("successMessage", "Your message has been sent");
			showProfile(model, session);
		} catch (ServiceDownException serviceDown) {
			model.addAttribute("errorMessage", serviceDown.getMessage());
			returnValue = "error";
		}
		return returnValue;
	}
}
