package com.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "tags")
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "tag_id")
	private int id;

	@Column(name = "tag_title")
	private String tagTitle;

	@ManyToMany(mappedBy = "tags")
	private Set<Issue> allIssueUnderThisTag;

	public Tag() {
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

	public Set<Issue> getAllIssueUnderThisTag() {
		return allIssueUnderThisTag;
	}

	public void setAllIssueUnderThisTag(Set<Issue> allIssueUnderThisTag) {
		this.allIssueUnderThisTag = allIssueUnderThisTag;
	}

}
