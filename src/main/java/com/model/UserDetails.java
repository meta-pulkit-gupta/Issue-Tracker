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

	@ManyToOne
	@JoinColumn(name = "dept_id")
	private Department dept_id;

	@Column(name = "profile_pic_url")
	private String pictureURL;

	public UserDetails() {

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

	public Department getDept_id() {
		return dept_id;
	}

	public void setDept_id(Department dept_id) {
		this.dept_id = dept_id;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", googleId=" + googleId + ", emailId="
				+ emailId + ", name=" + name + ", role=" + role + ", dept_id="
				+ dept_id + ", pictureURL=" + pictureURL + "]";
	}

}
