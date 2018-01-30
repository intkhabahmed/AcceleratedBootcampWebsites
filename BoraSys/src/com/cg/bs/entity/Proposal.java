package com.cg.bs.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Proposals")
public class Proposal {
	@Id
	@SequenceGenerator(name = "proposal_id_generator", sequenceName = "proposalId_sequence")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "proposal_id_generator")
	private int proposalId;

	private String fileName;
	@Lob
	private byte[] fileData;
	private String companyName;
	private String teamName;
	private Date proposalDate;

	public Proposal() {
		super();
	}

	public int getProposalId() {
		return proposalId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getFile() {
		return fileData;
	}

	public void setFile(byte[] file) {
		this.fileData = file;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public Date getProposalDate() {
		return proposalDate;
	}

	public void setProposalDate(Date proposalDate) {
		this.proposalDate = proposalDate;
	}


}
