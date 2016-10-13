package com.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "issues")
public class Issues {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "issue_id")
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserDetails createdBy;

	@Column(name = "created_on")
	private Timestamp createdOn;

	@ManyToOne
	@JoinColumn(name = "dept_id")
	private Department department;

	@Column(name = "body")
	private String body;

	@Column(name = "current_status")
	private String currentStatus;

	@Column(name = "priority")
	private String priority;

	@Column(name = "target_resolution_date")
	private Timestamp targetResolutionDate;

	@Column(name = "actual_resolution_date")
	private Timestamp actualResolutionDate;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private List<IssueStatus> issueStatus;

	
	public Issues() {
		
	}
	
	public Issues(int id, UserDetails createdBy, Timestamp createdOn,
			Department department, String body, String currentStatus,
			String priority, Timestamp targetResolutionDate,
			Timestamp actualResolutionDate, List<IssueStatus> issueStatus) {
		super();
		this.id = id;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.department = department;
		this.body = body;
		this.currentStatus = currentStatus;
		this.priority = priority;
		this.targetResolutionDate = targetResolutionDate;
		this.actualResolutionDate = actualResolutionDate;
		this.issueStatus = issueStatus;
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserDetails getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(UserDetails createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	
	public String getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public Timestamp getTargetResolutionDate() {
		return targetResolutionDate;
	}

	public void setTargetResolutionDate(Timestamp targetResolutionDate) {
		this.targetResolutionDate = targetResolutionDate;
	}

	public Timestamp getActualResolutionDate() {
		return actualResolutionDate;
	}

	public void setActualResolutionDate(Timestamp actualResolutionDate) {
		this.actualResolutionDate = actualResolutionDate;
	}

	public List<IssueStatus> getIssueStatus() {
		return issueStatus;
	}

	public void setIssueStatus(List<IssueStatus> issueStatus) {
		this.issueStatus = issueStatus;
	}

	@Override
	public String toString() {
		return "Issues [id=" + id + ", createdBy=" + createdBy + ", createdOn="
				+ createdOn + ", department=" + department + ", body=" + body
				+ ", currentStatus=" + currentStatus + ", priority=" + priority
				+ ", targetResolutionDate=" + targetResolutionDate
				+ ", actualResolutionDate=" + actualResolutionDate
				+ ", issueStatus=" + issueStatus + "]";
	}
	
	
	
}
