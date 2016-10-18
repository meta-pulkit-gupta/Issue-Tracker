package com.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "issue_status")
public class IssueStatus {

	@Id
	@Column(name = "issue_id")
	private int id;

	@Column(name = "status")
	private String status;

	@Column(name = "updated_on")
	private Timestamp updatedOn;

	@Column(name = "updated_by")
	private int updatedBy;
	
	@Autowired
	@ManyToOne
	@JoinColumn(name="issue_id",insertable=false, updatable=false)
	private Issue issue;

	public IssueStatus() {
		super();
	}

	
	public IssueStatus(int id, String status, Timestamp updatedOn, int updatedBy) {
		super();
		this.id = id;
		this.status = status;
		this.updatedOn = updatedOn;
		this.updatedBy = updatedBy;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Issue getIssue() {
		return issue;
	}

	public void setIssue(Issue issue) {
		this.issue = issue;
	}

	
}
