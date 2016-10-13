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
@Table(name = "comments")
public class Comments {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private int id;

	@ManyToOne
	@JoinColumn(name = "issue_id")
	private Issues issue;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserDetails user;

	private String comment;

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

	public UserDetails getUser() {
		return user;
	}

	public void setUser(UserDetails user) {
		this.user = user;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Comments [id=" + id + ", issue=" + issue + ", user=" + user
				+ ", comment=" + comment + "]";
	}

}
