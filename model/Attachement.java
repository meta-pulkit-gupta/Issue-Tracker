package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "issue_attachment")
public class Attachement {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "attachment_id")
	private int id;

	@Column(name = "issue_id")
	private int issueId;

	@Column(name = "attachment_url")
	private String attachmentURL;
	
	public Attachement() {
		
	}

	public Attachement(int id, int issueId, String attachmentURL) {
		super();
		this.id = id;
		this.issueId = issueId;
		this.attachmentURL = attachmentURL;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public int getIssueId() {
		return issueId;
	}


	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}


	public String getAttachmentURL() {
		return attachmentURL;
	}

	public void setAttachmentURL(String attachmentURL) {
		this.attachmentURL = attachmentURL;
	}



}
