package com.poly.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="News")
public class New {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer id;
	String title;
	String description;
	String content;
	String thumbnail;	
//	String CreateBy;	
	Date createDate;
	Boolean status;
//	Integer CategoryId;
	Integer countViewer;
	
	@ManyToOne
	@JoinColumn(name="categoryId")
	Category categories;
	
	@ManyToOne
	@JoinColumn(name="createBy")
	User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCountViewer() {
		return countViewer;
	}

	public void setCountViewer(Integer countViewer) {
		this.countViewer = countViewer;
	}



	
	
	
		

}
