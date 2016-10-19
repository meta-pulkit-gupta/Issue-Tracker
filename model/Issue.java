package com.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "issues")
public class Issue {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "issue_id")
	private int id;

	@Column(name = "title")
	private String title;

	@Autowired
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "created_by")
	private UserDetails createdBy;

	@Column(name = "created_on")
	private Timestamp createdOn;

	@Autowired
	@ManyToOne(fetch = FetchType.EAGER)
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

	@Autowired
	@ManyToMany(targetEntity = UserDetails.class, cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(name = "issue_resolvers", joinColumns = { @JoinColumn(name = "issue_id") }, inverseJoinColumns = { @JoinColumn(name = "resolver_id") })
	private List<UserDetails> resolvers;

	@Autowired
	@OneToMany(mappedBy = "issue", cascade = { CascadeType.ALL })
	private List<Comment> comments;

	@Autowired
	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "issue_tags", joinColumns = { @JoinColumn(name = "issue_id") }, inverseJoinColumns = { @JoinColumn(name = "tag_id") })
	private Set<Tag> tags;

	@Autowired
	@OneToMany(mappedBy = "issue")
	private List<IssueStatus> statusHistory;

	public Issue() {
		super();
	}

	public Issue(int id, UserDetails createdBy, Timestamp createdOn,
			Department department, String body, String currentStatus,
			String priority, Timestamp targetResolutionDate,
			Timestamp actualResolutionDate, List<UserDetails> resolvers,
			List<Comment> comments, Set<Tag> tags,
			List<IssueStatus> statusHistory) {
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
		this.resolvers = resolvers;
		this.comments = comments;
		this.tags = tags;
		this.statusHistory = statusHistory;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public List<UserDetails> getResolvers() {
		return resolvers;
	}

	public void setResolvers(List<UserDetails> resolvers) {
		this.resolvers = resolvers;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public List<IssueStatus> getStatusHistory() {
		return statusHistory;
	}

	public void setStatusHistory(List<IssueStatus> statusHistory) {
		this.statusHistory = statusHistory;
	}

}
