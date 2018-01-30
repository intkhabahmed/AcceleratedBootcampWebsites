package com.cg.bc.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Messages")
public class Message {
	@Id
	@SequenceGenerator(name = "message_id_generator", sequenceName = "messageId_sequence")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "message_id_generator")
	private int messageId;
	private String receiver;
	private String message;
	private String sender;
	private Date messageDate;

	public Message() {
		super();
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

}
