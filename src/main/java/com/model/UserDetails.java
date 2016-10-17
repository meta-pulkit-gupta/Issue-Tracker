package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "user_details")
public class UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int id;

	@Column(name = "google_id")
	private String googleId;

	@Column(name = "email")
	private String emailId;

	@Column(name = "name")
	private String name;

	@Column(name = "role")
	private String role;

	@Autowired
	@ManyToOne
	@JoinColumn(name = "dept_id")
	private Department department;

	@Column(name = "profile_pic_url")
	private String pictureURL;
	
	@Autowired
	@OneToOne
	@PrimaryKeyJoinColumn
	private Department deptHead;
	
	/**
	 * list of assigned issues 
	 * applicable where the role of user is "resolver"
	 * */
	@Autowired
	@ManyToMany(mappedBy="resolvers")
	private List<Issue> assignedIssueList;	
	
	/**
	 * list of all submitted issues by the user
	 * */
	@Autowired
	@OneToMany(mappedBy="createdBy")
	private List<Issue> submittedIssues;
	
	
	public UserDetails() {
		super();
	}


	public UserDetails(int id, String googleId, String emailId, String name,
			String role, Department department, String pictureURL,
			Department deptHead, List<Issue> assignedIssueList,
			List<Issue> submittedIssues) {
		super();
		this.id = id;
		this.googleId = googleId;
		this.emailId = emailId;
		this.name = name;
		this.role = role;
		this.department = department;
		this.pictureURL = pictureURL;
		this.deptHead = deptHead;
		this.assignedIssueList = assignedIssueList;
		this.submittedIssues = submittedIssues;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getGoogleId() {
		return googleId;
	}


	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public Department getDepartment() {
		return department;
	}


	public void setDepartment(Department department) {
		this.department = department;
	}


	public String getPictureURL() {
		return pictureURL;
	}


	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}


	public Department getDeptHead() {
		return deptHead;
	}


	public void setDeptHead(Department deptHead) {
		this.deptHead = deptHead;
	}


	public List<Issue> getAssignedIssueList() {
		return assignedIssueList;
	}


	public void setAssignedIssueList(List<Issue> assignedIssueList) {
		this.assignedIssueList = assignedIssueList;
	}


	public List<Issue> getSubmittedIssues() {
		return submittedIssues;
	}


	public void setSubmittedIssues(List<Issue> submittedIssues) {
		this.submittedIssues = submittedIssues;
	}


	@Override
	public String toString() {
		return "UserDetails [id=" + id + ", googleId=" + googleId
				+ ", emailId=" + emailId + ", name=" + name + ", role=" + role
				+ ", department=" + department + ", pictureURL=" + pictureURL
				+ ", deptHead=" + deptHead + ", assignedIssueList="
				+ assignedIssueList + ", submittedIssues=" + submittedIssues
				+ "]";
	}
	
	
	

}
