package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "department")
public class Department {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "dept_id")
	private int id;

	@Column(name = "dept_name")
	private String departmentName;

	/*
	 * @Autowired
	 * 
	 * @OneToOne
	 * 
	 * @JoinColumn(name="dept_head") private UserDetails departmentHead;
	 */

	@Autowired
	@OneToMany(mappedBy = "department", fetch = FetchType.LAZY)
	private List<Issue> allIssues;

	@Autowired
	@OneToMany(mappedBy = "department", fetch = FetchType.LAZY)
	private List<UserDetails> resolvers;

	public Department() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public List<Issue> getAllIssues() {
		return allIssues;
	}

	public void setAllIssues(List<Issue> allIssues) {
		this.allIssues = allIssues;
	}

	public List<UserDetails> getResolvers() {
		return resolvers;
	}

	public void setResolvers(List<UserDetails> resolvers) {
		this.resolvers = resolvers;
	}

}
