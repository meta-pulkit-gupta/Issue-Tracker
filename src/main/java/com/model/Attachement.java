package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

	@ManyToOne
	@JoinColumn(name = "issue_id")
	private Issues issue;

	@Column(name = "attachment_url")
	private String attachmentURL;
	
	public Attachement() {
		
	}

	public Attachement(int id, Issues issue, String attachmentURL) {
		super();
		this.id = id;
		this.issue = issue;
		this.attachmentURL = attachmentURL;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Issues getIssue() {
		return issue;
	}

	public void setIssue(Issues issue) {
		this.issue = issue;
	}

	public String getAttachmentURL() {
		return attachmentURL;
	}

	public void setAttachmentURL(String attachmentURL) {
		this.attachmentURL = attachmentURL;
	}

	@Override
	public String toString() {
		return "Attachement [id=" + id + ", issue=" + issue
				+ ", attachmentURL=" + attachmentURL + "]";
	}

}
