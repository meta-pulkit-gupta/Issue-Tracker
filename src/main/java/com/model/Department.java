package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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

	@Autowired
	@OneToOne
	@JoinColumn(name = "dept_head")
	private UserDetails departmentHead;
	
	public Department() {
	}
	
	public Department(int id, String departmentName, UserDetails departmentHead) {
		super();
		this.id = id;
		this.departmentName = departmentName;
		this.departmentHead = departmentHead;
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

	public UserDetails getDepartmentHead() {
		return departmentHead;
	}

	public void setDepartmentHead(UserDetails departmentHead) {
		this.departmentHead = departmentHead;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", departmentName=" + departmentName
				+ ", departmentHead=" + departmentHead + "]";
	}

}
