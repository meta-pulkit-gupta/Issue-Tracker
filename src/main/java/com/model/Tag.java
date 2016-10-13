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
@Table(name = "tags")
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "tag_title")
	private String tagTitle;
	
	public Tag() {
		// TODO Auto-generated constructor stub
	}

	public Tag(int id, String tagTitle) {
		super();
		this.id = id;
		this.tagTitle = tagTitle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTagTitle() {
		return tagTitle;
	}

	public void setTagTitle(String tagTitle) {
		this.tagTitle = tagTitle;
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", tagTitle=" + tagTitle + "]";
	}

}
